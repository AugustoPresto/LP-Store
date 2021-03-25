class Order
  attr_accessor :id, :lp, :customer, :employee, :delivered

  def initialize(attributes = {})
    @id = attributes[:id]
    @lp = attributes[:lp]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
