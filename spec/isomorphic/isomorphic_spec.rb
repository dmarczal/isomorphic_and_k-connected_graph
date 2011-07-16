require 'lib/graph/graph'
require 'lib/isomorphic/isomorphic'
require 'mixins/graph_creation'

describe Isomorphic do
  include GraphCreation
  
  before(:each) do
 
    @graph_a = [[0,1,1,0,0,0],[1,0,0,1,0,1],
                [1,0,0,1,0,0],[0,1,1,0,0,0],
                [0,0,0,0,0,0],[0,1,0,0,0,0]]


    @graph_b = [[0,1,1,0,0,0],[1,0,0,1,0,1],
                [1,0,0,1,0,0],[0,1,1,0,0,0],
                [0,0,0,0,0,0],[0,1,0,0,0,0]]

    @isomorphic = Isomorphic.new
  end

#  it "should have the same numbers of edges" do
#    @isomorphic.same_number_of_edges?(@graph_a, @graph_b).should be_true
#  end
#
#  it "should have the same numbers of nodes" do
#    @isomorphic.same_number_of_edges?(@graph_a, @graph_b).should be_true
#  end
#
#  it "should have the same degree vector" do
#    @isomorphic.same_degree_vector?(@graph_a, @graph_b).should be_true
#  end

  it "should ve isomorphic graph" do
    @isomorphic.isomorphic?(@graph_a, @graph_b).should be_true
  end
end
