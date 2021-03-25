require_relative '../models/customer'
require_relative '../views/customer_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end

  def add
    name = @view.ask_for_customer_name
    email = @view.ask_for_customer_email
    address = @view.ask_for_customer_address
    customer = Customer.new(name: name, email: email, address: address)
    @customer_repository.create(customer)
  end

  def find
    selected_customer = @customer_repository.find(@view.ask_for_customer_index)
    @view.show_customer(selected_customer)
  end

  def destroy
    customer_index = @view.ask_for_customer_index
    @customer_repository.destroy(customer_index)
  end

  def edit
    selected_customer = @view.ask_for_customer_index
    customer_name = @view.ask_for_new_customer_name
    customer_email = @view.ask_for_new_customer_email
    customer_address = @view.ask_for_new_customer_address
    @customer_repository.edit(selected_customer, customer_name, customer_email, customer_address)
  end
end
