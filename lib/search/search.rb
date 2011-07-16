$: << File.dirname(__FILE__)
require 'selector'
#require 'lib_graph'

class Search
  #include LibGraph

  def initialize(selector)
    @selector = selector
  end

  def search(graph, s) #up, inn, out)
    #count = 1 
    list = @selector.create_vertex_set(graph) 

    @selector.add_vertex_to_set(s, list)
    graph.visit_vertex(s)
    #mark_vertex(s, graph)

    #up[s] = 0
    #inn[s] = count

    while (not @selector.empty_set(list)) do
      #count += 1

      # escolha um v pertencente a L a partir do selector
      v = @selector.choose_from_set(list)

      # se em E(u) existe uma aresta não visitada a partir de v
      u = @selector.choose_neighbour(v, list)

      if (u)
        graph.visit_edge(u, v)
        #mark_edge(v, u, graph)
        @selector.add_vertex_to_set(u, list)
        graph.visit_vertex(u)
        #mark_vertex(u, graph)
        #up[u] = v;
        #inn[u] = count;
      else
        @selector.remove_from_set(v, list);
        #out[v] = count
      end
    end
    graph
  end
end
