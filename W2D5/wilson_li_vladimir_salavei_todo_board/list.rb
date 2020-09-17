require_relative "item.rb"

class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        end

        return false
    end

    def size
        @items.length
    end

    def valid_index?(i)
        i < self.size && i >= 0 
    end

    def swap(idx1, idx2) #test after lunch

        if valid_index?(idx1) && valid_index?(idx2)
            @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
            return true 
        else
            return false 
        end

    end

    def [](i)
        if valid_index?(i) 
            @items[i] 
        else
            return nil
        end
    end
    
    def priority
        @items[0] 
    end

    def print 

        puts "----------------".ljust(51, "-")
        puts "#{self.label.upcase}".center(51)
        puts "----------------".ljust(51, "-")
        puts " Index | Item                  | Deadline   | Done " #added 7
        puts "----------------".ljust(51, "-")
        (0...@items.length).each do |i|
            if self[i].done
            puts " #{i}".ljust(7) + "| #{self[i].title}".ljust(24) + "| #{self[i].deadline}".ljust(13) + "| [ ✓ ]".ljust(7)
            else 
            puts " #{i}".ljust(7) + "| #{self[i].title}".ljust(24) + "| #{self[i].deadline}".ljust(13) + "| [   ]".ljust(7)
            end
        end
        puts "----------------".ljust(51, "-")

    end

    def print_full_item(i)
        if valid_index?(i)
            puts "----------------".ljust(51, "-")
            if self[i].done
                puts "#{self[i].title}".ljust(33) + "#{self[i].deadline}" + "| [ ✓ ] "
            else 
                puts "#{self[i].title}".ljust(33) + "#{self[i].deadline}" + "| [   ] "
            end
            puts "#{self[i].description}".ljust(51)
            puts "----------------".ljust(51, "-")
        end
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(i, amount=1)
        if valid_index?(i) && amount <= i
            j = 0 
            while j < amount  
                self.swap(i, i-1)
                i -= 1
                j += 1
            end 
            return  true
        elsif valid_index?(i) && amount > i 
            temp = @items[i]
            @items.delete_at(i)
            @items.unshift(temp)
            return true
        else 
            return false
        end   
    end

    def down(i, amount=1)
        if valid_index?(i) && amount < self.size - i
            j = 0
            while j < amount 
                self.swap(i, i+1)
                i += 1
                j += 1
            end
            return true
        elsif valid_index?(i) && amount > self.size - i
            temp = @items[i]
            @items.delete_at(i)
            @items.push(temp)
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end

    def toggle_item(i)
        @items[i].toggle if valid_index?(i)
    end

    def remove_item(i)
        if valid_index?(i)
            @items.delete_at(i)
            return true 
        else
            return false
        end
    end

    def purge
        @items.select! {|item| !item.done }
    end

end

