require_relative '00_tree_node.rb'

class KnightPathFinder

  attr_reader :root_node, :considered_positions

  def initialize(x,y)
    @root_node = [x,y]
    @considered_positions = KnightPathFinder.valid_moves([x,y])

    # KnightPathFinder.build_move_tree

  end

  def self.valid_moves(pos)
    valids = []
    x,y = pos

    # (x-1..x+1).each do |the_x|
    #   (y-1..y+1).each do |the_y|
    #     #we need to make sure -1 < x,y < 8
    #     if the_x >= 0 && the_x <= 7 && the_y >=0 && the_y <=7 && [the_x,the_y] != pos
    #       valids << [the_x, the_y] 
    #     end
        
    #   end
    #end

    (x-2..x+2).each do |the_x|
      #as long as the_x doesnt equal x
      if the_x == x-2 || the_x == x+2
        y1 = y-1
        y2 = y+1
      else
        y1 = y-2
        y2 = y+2
      end

      if the_x != x
        valids << [the_x, y1] if the_x >= 0 && y1 >= 0 && (the_x <= 7 && y1 <= 7)
        valids << [the_x, y2] if the_x >= 0 && y2 >= 0 && (the_x <= 7 && y2 <= 7)
      end
    end
  
    valids
  end

  def self.new_move_positions(pos)


  end


end

p k = KnightPathFinder.new(7,7)