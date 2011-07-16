require 'lib/graph/graph'
require 'lib/graph/node'
require 'mixins/graph_creation'

describe Graph do
  include GraphCreation

  before(:each) do
    @graph = create_graph(4, [1, 2], [1, 3],
                             [2, 4], [3, 4])
  end

  it "should create a graph" do
    puts @graph
  end

  it "should return the vector of degree in descreasing order" do
    @graph_b = create_graph(6, [1, 2], [1, 3],
                               [2, 4], [3, 4],
                               [2, 6])

    @graph.degree_vector == [2, 2, 2, 2]
    @graph_b.degree_vector == [3, 2, 2, 2, 1, 0]
  end 
  
  it "should return the bigest degree" do
     @graph_b = create_graph(6, [1, 2], [1, 3],
                               [2, 4], [3, 4],
                               [2, 6])

    @graph_b.max_degree.should == 3
  end


  # ------------- edge ------------------------------- #
  it "should return a edge" do
    @graph.edge(2,4).to.name.should == 4
    @graph.edge(4,2).from.name.should == 4
  end

  it "should return the number of edges" do
    @graph.number_of_edges.should == 4
  end

  it "should verify if a egde is on the graph" do
    @graph.contains_edge?(1, 2).should be_true
    @graph.contains_edge?(2, 1).should be_true
    @graph.contains_edge?(4, 5).should be_false
  end

  it "should visit a edge and mark as visit adge" do
    @graph.visit_edge(2,4) 
    @graph.edge(2,4).visit?.should == true
  end
 
  it "should verify if a edge as visit" do
    @graph.visit_edge(1, 2)
    @graph.visit_edge?(2, 1).should be_true
    @graph.visit_edge?(1, 2).should be_true
  end 

  it "should reset all edge marks" do
    @graph.visit_edge(1, 2)
    @graph.reset_edges
    @graph.visit_edge?(1, 2).should be_false
  end 

  # ------------- vertex ---------------------------- #
  it "should visit a vertex and mark as visit" do
    @graph.visit_vertex(2)
    @graph.vertex(2).visit?.should be_true
  end

  it "should verify if a vertex as visit" do
    @graph.visit_vertex(2)
    @graph.visit_vertex?(2).should be_true
    @graph.visit_vertex?(1).should be_false
  end

  it "should mark all vertex as not visit" do
     @graph.visit_vertex(2) 
     @graph.reset_vertices
     @graph.visit_vertex?(2).should be_false
  end

  it "should get the next_neighbour v of u)" do
    @graph.next_neighbour_of(1).should == 2
  end

  it "should reset all neighbourhood of all vertex" do
    @graph.reset_neighbourhood
  end


  it "should return a nighbour of v thar is not marked" do
    @graph.neighbour_not_visit_of(1).should == 2
  end

  it "should return a nighbour of v thar is not marked" do
    @graph.visit_edge(2,4) 
    @graph.neighbour_not_visit_of(4).should == 3
  end

  # remove a vertex #
  it "should remove a vertex" do
    @graph.remove_vertex(1)
    @graph.vertex(1).should be_nil
    @graph.vertex(2).neighbours.include?(1).should be_false
  end
end
