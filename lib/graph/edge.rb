class Edge
  attr_reader :from, :to, :visit, :visit_from
  
  def initialize(from, to)
    @from = from
    @to = to
  end

  def visit?
    @visit == true
  end

  def visit=(_booelean)
    @visit = _booelean
  end

  def invert
    tmp = @from
    @from = @to
    @to = tmp
  end
end
