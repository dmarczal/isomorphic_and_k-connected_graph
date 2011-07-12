require 'graph'
require 'node'

describe Graph do

  before(:each) do
    @graph = Graph.new(4)
    @graph.add_edge(1, 2) 
    @graph.add_edge(1, 3)
    @graph.add_edge(2, 4)
    @graph.add_edge(3, 4)
  end

  it "should create a graph" do
    puts @graph
  end

  # ------------- edge ------------------------------- #

  it "should return a edge" do
    @graph.edge(2,4).to.name.should == 4
    @graph.edge(4,2).from.name.should == 4
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

end
