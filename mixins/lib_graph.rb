=begin
/* biblioteca para tratamento de grafos                 */
/*                                                      */
/* - leitura de arquivo no formato matriz de adjacência */
/*   0 1 1                                              */        
/*   1 0 0                                              */
/*   1 0 0                                              */ 
/*                                                      */    
/*   0 0 1                                              */    
/*   0 0 1                                              */    
/*   1 1 0                                              */
*/                                                      */
/********************************************************/
/* Diego Marczal - 2011                                 */
=end

require 'lib/graph/graph'

module LibGraph

  # Lê os dados do arquivo no formato de matriz de adjacência
  # Cria um grafo Graph o retorna
  # Foi considerado que os dados do arquivo sempre em um formato correto
  def read_file_to_adjacency_list
    begin
      k = $stdin.readline.to_i
      graph = Graph.new
      row = 0
      
      line = $stdin.readline
      begin
        row += 1
        process_line(line, row, graph)
      end while(line = $stdin.readline) 
      # a última linha é ignorada, pois somente metade da matriz e percorrida,
      # ou seja, cada linha é percorrida, a partir do seu índice até seu tamanho
    rescue EOFError
    end
    graph.size= row
    {'k' => k, 'graph' => graph}
  end

  def process_line(line, row, graph)
    column = row
    (row...(line.size)).each do |c|
      if line[c] == 49 # = 1
        graph.add_edge(row, c+1) 
      end
      column += 1
    end
  end

  # def process_line(line, row, graph)
  #   column = 1
  #   line.each_char do |c|
  #     if c == "1"
  #       graph.add_edge(row, column)    
  #     end
  #     column += 1
  #   end
  # end

  
  # lê os dados de um arquivo e cria duas matrizes de adjacência
  # ...
  def read_file_matriz_adjacency
    begin
      first_graph = true
      column = -1
      matriz_a = [[]]
      matriz_b = [[]]

      while(line = $stdin.readline)
        if line.eql? "\n"  
          first_graph = false
          column = -1;
        else
          column += 1
          if first_graph 
            matriz_a[column] = line.delete("\n").split(//).collect{|x| x.to_i if not(x.eql?"\n")}
          else
            matriz_b[column] = line.delete("\n").split(//).collect{|x| x.to_i if not(x.eql?"\n")}
          end
        end
      end
    rescue EOFError
    end
    graph_a = Graph.new
    graph_b = Graph.new
    graph_a.matriz= matriz_a
    graph_b.matriz= matriz_b

    {1 => graph_a, 2 => graph_b}
  end
end
