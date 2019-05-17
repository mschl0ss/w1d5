class PolyTreeNode

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if !node.nil?
      #grab old parent before we assign new parent
      if @parent != nil
        old_parent = @parent
        index = old_parent.children.index(self)
        old_parent.children.delete_at(index) if index != nil
      end

      @parent = node
      @parent.children << self if !@parent.children.include?(self)
    else
      @parent = nil

    end
    
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Node is not a child" if !@children.include?(child_node)
    child_node.parent = nil
  end

  def inspect
    " Node: #{object_id}"
  end

  def dfs(target)
    return self if @value == target 
    return nil if @value == nil

    @children.each do |child|
      search = child.dfs(target)
      return search unless search.nil?
    end

    nil
  end

  def bfs(target)
    q = [self]
    
    until q.empty? 
      node = q.shift
      return node if node.value == target 
      node.children.each do |child|
        q << child
      end
    end

    nil
  end

end