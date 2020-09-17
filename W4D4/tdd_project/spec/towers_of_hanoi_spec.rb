require "towers_of_hanoi"
require "rspec"

describe Hanoi do 
    subject(:hanoi) { Hanoi.new }

    describe "#initialize" do
        it "should create the 3 stacks for the game" do
            expect(hanoi.stacks).to contain_exactly([1,2,3,4], [], [])
        end

        it "should have game over to be false at the beginning of the game" do
            expect(hanoi.game_over).to be(false)
        end

        it "should set default num_discs to 4, if no argument is given" do
            expect(hanoi.num_discs).to be(4)
        end
    end

    describe "#won?" do

        before(:each) { hanoi.stacks[1], hanoi.stacks[0] = [1,2,3,4], [] }
        it "should tell you if the game is won or lost depending on where the stack is" do
            expect(hanoi.won?).to be(true)
        end

        it "it should call #game_over"  do #ask about this during code review
            allow(hanoi).to receive(:game_over).and_return(true)
            # expect(hanoi).to receive(:game_over)
            # hanoi.won?
            # expect(hanoi).to receive("game_over")
        end
    end
   
    describe "#move" do
        before(:each) { hanoi.move(0, 1) }
        it "should move the top disc of any non-empty stack and place it on any other stack" do
            expect(hanoi.stacks).to contain_exactly([2,3,4], [1], [])
        end
        
        it "should not place a larger disc on a smaller disc" do
            expect{ hanoi.move(0,1) }.to raise_error("You can not place that disc there")
        end

    end

    describe "#play" do 
        it "should continue looping and getting player input until game is over" do
        end
        it "it should call gets.chomp to get input from the user" do
            allow(hanoi).to receive(:gets)
        end
      end
end

        




   