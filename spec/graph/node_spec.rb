require 'lib/graph/node'

describe Node do

  before(:each) do 
    @node = Node.new(1)
  end

  it "should be false if is not visit" do 
    @node.visit?.should be_false
  end

  it "should be true if is visit" do 
   @node.visit=true
   @node.visit?.should be_true
   @node.visit=false
   @node.visit?.should be_false
  end

  it "should return the next neighbour" do
    add_neighbours(2, 4, 3)
    @node.next_neighbour.should == 2
    @node.next_neighbour.should == 4
    @node.next_neighbour.should == 3
    @node.next_neighbour.should == nil
    @node.next_neighbour.should == 2
  end
 
  it "should return the degree " do
     add_neighbours(2, 4, 3)
     @node.degree.should == 3
  end

private
def add_neighbours(*neighbours)
  neighbours.each do |n|
    @node.add_neighbour(n)
  end
end


#  it "should be the same node if they have the same name" do
#    node = Node.new(1)
#    node2 = Node.new(1)
#
#    node.eql?(node2).should be_true
#  end
#
#  it "should not have the same neighbour two times" do
#     node = Node.new(1)
#     node = Node.new(1)
#     node.add_neighbour(node)
#     node.include_neighbour?(node).should be_false
#  end

end
