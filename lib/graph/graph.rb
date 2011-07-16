$: << File.dirname(__FILE__)
require 'edge'
require 'node'

# Representa um grafo através de uma lista de adjacências
# onde os vértices são nomeados com números.
class Graph
  attr_accessor :size, :matriz

  def initialize(size = 0)
    @nodes = Hash.new
    @edges = Hash.new
    self.size= size
  end

  def size=(size)
    @size = size
    (1..size).each do |n|
       @nodes[n] = Node.new(n) if @nodes[n].nil? 
    end
  end

  def matriz=(matriz)
    @matriz = matriz
    size = matriz.size
    size= size
    
    (0...size).each do |i|
       (0...size).each do |j|
         if matriz[i][j] == 1
           add_edge(i+1, j+1)
         end
       end   
    end
  end

  def add_edge(*edge)
    if edge.size == 2
        add_edge_by_nodes(edge[0], edge[1])
    else
      if edge.size == 1
        add_edge_by_nodes(edge[0][0], edge[0][1])
      end
    end
  end
  
  # ---------------vertex-------------------- # 
  # seleciona um vértice para começar a busca 
  def select_vertex
    @nodes.first[0]
  end

  def number_of_vertexs
    @nodes.size
  end

  def visit_vertex(v)
    @nodes[v].visit= true
  end

  def visit_vertex?(v)
    @nodes[v].visit
  end
 
  def reset_vertices
    (1..@size).each{|n| @nodes[n].visit= false;}
  end

  def vertex(index)
    @nodes[index]
  end

  def remove_vertex(v)
    vertex = @nodes[v]
    if vertex
      vertex.neighbours.each do |n|
        @nodes[n].remove_neighbour(v)
        @edges.delete [n,v]
        @edges.delete [v,n]
      end
      @nodes.delete(v)
    end
  end
 
  # ---------------edge-------------------- # 
  def edge(u,v)
    not_directed(u, v)
  end

  def number_of_edges
    @edges.size
  end

  def contains_edge?(u, v)
    not_directed(u,v)
  end

  def visit_edge(u,v)
    not_directed(u, v).visit= true
  end
  
  def visit_edge?(u,v)
    not_directed(u, v).visit?
  end
  
  def reset_edges
    @edges.each_value {|e| e.visit= false}
  end

  # --------------neightbourhood------------------ # 
  def next_neighbour_of(v)
    @nodes[v].next_neighbour
  end

  def reset_neighbourhood
    @nodes.each_value do |n|
      n.reset_neighbourhood
    end
  end
 
  def neighbour_not_visit_of(v)
    selected = nil

    @nodes[v].neighbours.each do |u|
      edge = not_directed(v, u)
      if (edge && (not(edge.visit?)) && (not(@nodes[u].visit?)))
        selected = u
        break
      end
    end if @nodes[v]
    selected
  end

  def degree_vector
    degree = @nodes.values.collect { |node| node.degree }
    degree.sort!
  end

  def max_degree
    degree_vector.max
  end
  
  # --------------neightbourhood------------------ # 
  
  def conneted?
    #@nodes = @nodes[1..@size]
    @nodes.each_value do |node|
      return false if not(node.visit?)
    end
    return true
  end

  def to_s
    out = "";
    @nodes.each_value do |n|
      #next if n.nil?
      out << "\n #{n.name} " 
      n.neighbours.each do |neighbour|
         out << "-> #{neighbour} "
      end
    end
    out
  end

  # clone the graph,
  # but without realy clone, the reset all the nodes
  # and edges
  def clone
    graph = Graph.new(@size)
    @edges.each_key do |key|
      graph.add_edge key
    end
    graph
  end

private 
  def not_directed(u,v)
    edge = @edges[[u,v]]
    if edge.nil?
      edge = @edges[[v,u]]
      edge.invert if not edge.nil?
    end
    edge
  end

  def add_edge_by_nodes(u,v)
    @nodes[v] = Node.new(v) if @nodes[v].nil? 
    @nodes[u] = Node.new(u) if @nodes[u].nil? 
    
    @nodes[u].add_neighbour(v)
    @nodes[v].add_neighbour(u)
    @edges[[u, v]] = Edge.new(@nodes[u], @nodes[v])
  end
end
