require "graphviz"

  # Lê os dados do arquivo no formato de matriz de adjacência
  # Cria um grafo GraphViz o retorna
  # Foi considerado que os dados do arquivo sempre em um formato correto
  def read_file_to_graphviz
    begin
      k = $stdin.readline.to_i
      graph = GraphViz::new( "structs", "type" => "graph" ) 
      row = 0
      
      line = $stdin.readline
      create_nodes(line, graph)
      begin
        row += 1
        process_line(line, row, graph)
      end while(line = $stdin.readline) 
      # a última linha é ignorada, pois somente metade da matriz e percorrida,
      # ou seja, cada linha é percorrida, a partir do seu índice até seu tamanho
    rescue EOFError
    end
    graph
  end

  def process_line(line, row, graph)
    column = row
    (row...(line.size)).each do |c|
      if line[c] == 49 # = 1
        graph.add_edge(row.to_s, (c+1).to_s) 
      end
      column += 1
    end
  end

  def create_nodes(line, graph)
    (1...(line.size)).each do |n|
      graph.add_node(n.to_s)
    end
  end


g = read_file_to_graphviz
g.output( :eps => "graph.eps" )
system("evince graph.eps &")
