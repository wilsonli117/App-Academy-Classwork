require "rspec" 
require "tdd"

describe Array do
    
    describe "#my_uniq" do
        let(:arr) { [1,1,2,2,3,3] }
        it "return a new array with duplicates removed"  do
            expect(arr.my_uniq).to eq([1,2,3])
        end
    end

    describe "#two_sum" do
        let(:arr) { [-1, 0, 2, -2, 1] }
        it "should return all pairs of positions where the elements at those positions sum to zero." do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe "#my_transpose" do
        let(:arr) { [
                    [0, 1, 2],
                    [3, 4, 5],
                    [6, 7, 8]] }
        it "should convert between the row-oriented and column-oriented representations. " do
            expect(arr.my_transpose).to eq([[0, 3, 6],
                                            [1, 4, 7],
                                            [2, 5, 8]])
        end
    end

    describe "#stock_picker" do
        let(:arr) { [23, 35, 48, 31, 72, 108, 1] } #[3,4] 
        it "should return the most profitable (lowest difference) pair of days (pair of indices)" do
            expect(arr.stock_picker).to eq([3,4])
        end
    end
    # [1..4] [] [] #we have to follow LIFO
    #only top(back of our array/pop "first" element ) most disk can be moved at a time
    #larger discs can not be on top of smaller ones
end
