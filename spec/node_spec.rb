require 'node'

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
    @node.add_neighbour(2)
    @node.add_neighbour(1)
    @node.add_neighbour(3)
    @node.next_neighbour.should == 2
    @node.next_neighbour.should == 3
    @node.next_neighbour.should == nil
    @node.next_neighbour.should == 2
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
