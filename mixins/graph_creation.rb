module GraphCreation
  
  def create_graph(n, *edges)
    @graph = Graph.new(n)
    
    edges.each do |edge|
      @graph.add_edge(edge)
    end
    @graph
  end

end
