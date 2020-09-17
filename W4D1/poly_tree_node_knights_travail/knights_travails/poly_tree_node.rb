class PolyTreeNode
    attr_reader :value, :children
    attr_accessor :parent
    

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
   
    def parent=(node_inst)
        if node_inst == nil
            self.parent.children.delete(self)
            @parent = node_inst
        elsif (self.parent != node_inst) && (self.parent != nil)
            self.parent.children.delete(self)
            @parent = node_inst
            self.parent.children << self
        elsif (self.parent != node_inst) && (self.parent == nil)
            @parent = node_inst
            self.parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "error :(" if !self.children.include?(child_node)
        child_node.parent = nil
    end

     def dfs(target)
        return self if self.value == target 
        self.children.each do |child|
            search = child.dfs(target)
            return search if search != nil
        end
        return nil
    end

    def bfs(target)
        search_array = [self]
            until search_array.empty?
                if search_array.first.value == target
                    return search_array.first
                else
                    el = search_array.shift
                    el.children.each do |child|
                        search_array << child
                    end
                end
            end

        return nil
    end

end