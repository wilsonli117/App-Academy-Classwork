require "byebug"

class PolyTreeNode
    attr_reader :value, :children
    attr_accessor :parent
    #PolyTreeNode.send(:bfs, :dfs)

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

    # def bfs(target)
    #     return self if self.value == target #extra check
    #     search_array = [self] #have to start on root because what if root has no children
    #     self.children.each do |child| #extra work if root.value == target, imagine if root was target and root had 1 million children
    #         search_array.push(child)
    #     end

    #     if search_array.first.value != target #if array was empty, search_array.first would = nil and nil.value would throw an error
    #         ele = search_array.shift
    #         ele.children.each do |child|
    #             search_array.push(child)
    #         end
    #     else
    #         return search_array.first
    #     end
        
    #     return nil

    # end

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

# class Searchable #is supposed to be module 

#     #Searchable.send(:bfs, root, target)
#     #Searchable.send(:dfs, root, target)

#     def dfs(root, target)
#         return root if root.value == target 
#         root.children.each do |child|
#             search = dfs(child, target)
#             return search unless search.nil?
#         end
#         return nil
#     end

#     def bfs(root, target)
#         return root if root.value == target #extra check
#         search_array = [root] #have to start on root because what if root has no children
#         root.children.each do |child| #extra work if root.value == target, imagine if root was target and root had 1 million children
#             search_array.push(child)
#         end

#         if search_array.first.value != target #if array was empty, search_array.first would = nil and nil.value would throw an error
#             ele = search_array.shift
#             ele.children.each do |child|
#                 search_array.push(child)
#             end
#         else
#             return search_array.first
#         end
        
#         return nil

#     end

    # def bfs(root,target)
    #     search_array = [root]
    #         until search_array.empty?
    #             if search_array.first.value == target
    #                 return array.first
    #             else
    #                 el = search_array.shift
    #                 el.children.each do |child|
    #                     search_array << child
    #                 end
    #             end
    #         end

    #     return nil
    # end


#end

#queue FIFO
#shoveling children into queue <- push
#check children <= shift if children.value != target
#if children.value == target return child/node instance
#empty queue is our base case, end condition. once we have an empty queue, we've looked through every single node

#recursive
#uses the stack data structure
#base case = return nil if there are no more children

# node1 = PolyTreeNode.new("root1")
# node2 = PolyTreeNode.new("child1")
# node3 = PolyTreeNode.new("child2")

# node2.parent = node1
# node3.parent = node2
# node3.parent = node1



# node.new.parent = b
#a.add_child(b)
#a.remove_child(b)
#self = a
#a.children.include?(b)
# new_node.parent = 
# parent.add_child(new_node)

