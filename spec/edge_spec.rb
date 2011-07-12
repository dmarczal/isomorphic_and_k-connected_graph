require 'edge'

describe Edge do

  it "should invert a edge" do
    edge = Edge.new 1, 2
    edge.invert
    edge.to.should == 1
    edge.from.should == 2
  end
  
end
