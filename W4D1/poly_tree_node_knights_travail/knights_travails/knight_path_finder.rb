require_relative "poly_tree_node"

class KnightPathFinder
    attr_reader :root_node

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        #@move_tree = [self.root_node] #[full of node instances representing the 8 possible moves]]
        build_move_tree
    end

    def find_path(end_pos) #refactor to use bfs or dfs
        #starts at starting position of knight instance
        #will return a 2d array of position path needed to reach arg pos
        #result includes arg and start pos 
        #will search through move tree
        
        #@move_tree.each { |node| path << node if node.value == end_pos }

        node = @root_node.bfs(end_pos) unless @root_node.bfs(end_pos).nil?
        
        trace_path_back(node)

    end

    def trace_path_back(end_pos_node)
        path = [end_pos_node] 
        path.unshift(path[0].parent) until path.first == self.root_node
        path.map { |node| node.value }
    end

    def self.valid_moves(pos)
        poss_moves = []
        # need a conditional if either of the positions is negative, we don't include it
        #[0,0] #=> up and down can be [2,1],[2,-1], [-2,1], [-2,-1]
              #=> left and right can be [1,2], [1,-2], [-1,2], [-1,-2]
        row, col = pos[0], pos[1]
        
            poss_moves << [row + 2, col + 1]
            poss_moves << [row + 2, col - 1]
            poss_moves << [row - 2, col + 1]
            poss_moves << [row - 2, col - 1]
            poss_moves << [row + 1, col + 2]
            poss_moves << [row + 1, col - 2]
            poss_moves << [row - 1, col + 2]
            poss_moves << [row - 1, col - 2]
  
        poss_moves.select { |move| move[0].between?(0,7) && move[1].between?(0,7)}    
    end

    def new_move_positions(pos) #pos_arr probably coming from move tree
        new_pos_arr = []
        poss_moves = KnightPathFinder.valid_moves(pos)
            poss_moves.each do |new_poss|
                if !@considered_positions.include?(new_poss)
                    @considered_positions << new_poss
                    new_pos_arr << new_poss
                end
            end
        new_pos_arr
    end


    def build_move_tree
        queue = [self.root_node]
        until queue.empty?
            el = queue.shift
            new_move_positions(el.value).each do |move|
                child = PolyTreeNode.new(move)
                el.add_child(child)
                #@move_tree << child
                queue << child
            end
            
        end
        #will be calling new_move_positions
        #need a method to build move tree
        #root of move tree will be starting position
    end

    
end