class Node
  attr_reader :name, :visit
  
  def initialize(name)
    @name = name
    @neighbours = []
    @current = 0;
    @number_of_neibours = 0
  end

  def visit?
    @visit == true
  end

  def visit=(_boolean)
    @visit = _boolean
  end

  def add_neighbour(node)
    unless (@neighbours.include?(node) || node.eql?(@name))
        @neighbours << node
        @number_of_neibours +=1
    end
  end

  def neighbours
    @neighbours
  end

  def neighbour(index)
    @neighbours[index]
  end
  
  def remove_neighbour(n)
    n = @neighbours.delete(n)
    @number_of_neibours -= 1 unless n.nil?
  end

  def degree
    @number_of_neibours
  end

  def next_neighbour
    neighbour = @neighbours[@current]
    @current == @neighbours.size ? @current = 0 : @current += 1
    neighbour
  end

  def reset_neighbourhood
    @current = 0
  end

#  def eql?(other)
#    if other.instance_of? Node
#      return other.name.eql? @name
#    end
#    return false  
#  end

#  def include_neighbour?(node)
#    @neighbours.include? node
#  end

end
