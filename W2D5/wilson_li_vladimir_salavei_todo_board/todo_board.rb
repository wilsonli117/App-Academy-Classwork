require_relative "list.rb"

class TodoBoard

    def initialize
        @board = {} #label will be key, and instance will be value
        #@list = List.new(list)
    end

    def get_command
        puts "Enter a command: "
        cmd, *args = gets.chomp.split(" ")

        list_label = args.first 
        arguments = args[1..-1]
        
        x = arguments.map(&:to_i) if args.length > 1
        

        case cmd 
        when 'mklist'
            @board[list_label] = List.new(list_label)
        when 'ls' 
            puts @board.keys
        when 'showall' #fix this feature
            @board.each { |k,v| v.print }
        when 'mktodo'
            @board[list_label].add_item(*arguments)
        when 'up'
            @board[list_label].up(*x)
        when 'down'
            @board[list_label].down(*x)
        when 'swap'
            @board[list_label].swap(*x)
        when 'sort' 
            @board[list_label].sort_by_date!
        when 'priority'
            @board[list_label].print_priority
        when 'print'
            if arguments.length == 0
                @board[list_label].print 
            elsif arguments.length > 0 
                @board[list_label].print_full_item(*x)
            end
        when 'toggle'
            @board[list_label].toggle_item(*x)
        when 'rm'
            @board[list_label].remove_item(*x)
        when 'purge'
            @board[list_label].purge
        when 'quit'
            return false 
        else
            puts "Sorry, that command is not recognized."
        end

        true

    end
        
    def run
        until !self.get_command
        
        end
    end


end

test = TodoBoard.new
test.run