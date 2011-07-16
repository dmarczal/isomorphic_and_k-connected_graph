require 'lib/search/search'
require 'lib/search/bfs_selector'

class KConexo
  
  def initialize
    @bfs = Search.new(BfsSelector.new)
  end

  def k_conexo?(k, graph)
    size = graph.size
    return false if k < 1 || k >= size 

    vertexs = (1..graph.size).to_a
    combination = vertexs.combination k-1
    while(true)
      begin
        c = combination.next
        graph_b = graph.clone

        c.each do |e|
          graph_b.remove_vertex e
        end
        
        bfs(graph_b)
        return false unless conneted?(graph_b)
        
      rescue StopIteration
        return true
      end
    end
  end 

  
  def bfs(graph)
    @bfs.search(graph, graph.select_vertex)
  end

  def conneted?(graph)
    graph.conneted?
  end

end # end class
