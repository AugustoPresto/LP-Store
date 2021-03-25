class Customer
  attr_accessor :id, :name, :email, :address

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @email = attributes[:email]
    @address = attributes[:address]
  end
end
