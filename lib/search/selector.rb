class Selector 
 
  def create_vertex_set(graph)
    @graph = graph
    Array.new
  end

  def add_vertex_to_set(v, l)
    l.push v
  end

  def empty_set(l)
    l.empty?
  end

  # choose a neighbour v of u such that edge {u,v} is not marked */
  def choose_neighbour(u, l)
    @graph.neighbour_not_visit_of(u)
  end

  def remove_from_set(u, l)
    l.delete u
  end

  # choose from set
  def choose_from_set(l)
    raise "You should implements chosse_from_set(u, l)"
  end

end
