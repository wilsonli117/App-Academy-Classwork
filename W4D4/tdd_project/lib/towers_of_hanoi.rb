class Hanoi

    attr_reader :stacks, :num_discs
    attr_accessor :game_over

    def initialize(num_discs=4)
        @stacks = [ (1..num_discs).to_a, [], [] ]
        @game_over = false
        @num_discs = num_discs
    end

    def won?
        if self.stacks[1].length == self.num_discs || self.stacks[2].length == self.num_discs
            self.game_over = true
            return true
        end

        return false
    end
        
    def move(stack1, stack2) 
        if !stacks[stack1].empty? && (stacks[stack2].empty? || (stacks[stack1].first < stacks[stack2].first))
            el = stacks[stack1].shift
            stacks[stack2].unshift(el)
        else
            raise StackError.new("You can not place that disc there")
        end
    end

    def play
        until won?
            begin
                puts "Please input the 2 integers representing the stack(1,2 or 3) you want to remove a disc from, and stack you want to place it on i.e. 1,2"
                input = gets.chomp
                stack_input = input.split(',').map { |ele| ele.to_i - 1 }
                move(stack_input[0], stack_input[1])
            rescue StackError => e
                puts e.message
                retry
            end

        end
    end
end

class StackError < StandardError
end