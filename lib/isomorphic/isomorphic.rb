class Isomorphic

  def same_number_of_edges?(graph_a, graph_b)
    graph_a.number_of_edges == graph_b.number_of_edges
  end
  
  def same_number_of_vertexs?(graph_a, graph_b)
    graph_a.number_of_vertexs == graph_b.number_of_vertexs
  end

  def same_degree_vector?(graph_a, graph_b)
    graph_a.degree_vector == graph_b.degree_vector
  end

  def isomorphic?(graph_a, graph_b)
    return false unless same_number_of_vertexs?(graph_a, graph_b)
    return false unless same_number_of_edges?(graph_a, graph_b)
    return false unless same_degree_vector?(graph_a, graph_b)
    permutation(graph_a.matriz, graph_b.matriz)
  end

  def permutation(matriz_a, matriz_b)
    size = matriz_a.size
    labels = (0...size).to_a
  
    permutation = labels.permutation
    while(true)
      begin
        perm = permutation.next
        #p perm
        if test_perm(matriz_a, matriz_b, perm)
          return true
        end
      rescue StopIteration
        return false
      end
   end
  end

  def test_perm(matriz_a, matriz_b, perm)
    size = matriz_a.size
      (0...size).each do |x|
        (0...size).each do |y|
          a = matriz_a[x][y]
          #puts "matriz_b[perm[#{x}]][perm[#{y}]] = matriz_b[#{perm[x]}][#{perm[y]}]  =  #{matriz_b[perm[x]][perm[y]]}"
          b = matriz_b[perm[x]][perm[y]]
          return false if a != b
        end  
      end
      return true
  end

end
