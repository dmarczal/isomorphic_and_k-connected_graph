$: << File.dirname(__FILE__)
require 'edge'
require 'node'

# Representa um grafo através de uma lista de adjacências
# onde os vértices são nomeados com números.
class Graph

  attr_accessor :size

  def initialize(size)
    @size = size
    @nodes = []
    @edges = Hash.new
    
    @nodes.push nil
    (1..@size).each do |e|
       @nodes.push(Node.new(e))
    end
  end

  def add_edge(u, v)
    @nodes[u].add_neighbour(v)
    @nodes[v].add_neighbour(u)
   @edges[[u, v]] = Edge.new(@nodes[u], @nodes[v])
  end

  # ---------------vertex-------------------- # 
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
  # ---------------edge-------------------- # 
  def edge(u,v)
    not_directed(u, v)
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
    @nodes.each do |n|
      n.reset_neighbourhood unless n.nil?
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

  def to_s
    out = "";
    @nodes.each do |n|
      next if n.nil?
      out << "\n #{n.name} " 
      n.neighbours.each do |neighbour|
         out << "-> #{neighbour} "
      end
    end
    out
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
end
