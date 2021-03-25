require_relative '../models/order'
require_relative '../views/order_view'

class OrdersController
  def initialize(lp_repository, customer_repository, employee_repository, order_repository)
    @lp_repository = lp_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @order_view = OrderView.new
  end

  # Manager
  def add
    lp_index = @order_view.ask_for("What's the LP ID")
    customer_index = @order_view.ask_for("The customer ID")
    employee_index = @order_view.ask_for("And the employee ID")
    order = Order.new(lp: @lp_repository.find(lp_index), customer: @customer_repository.find(customer_index), employee: @employee_repository.find(employee_index))
    @order_repository.create(order)
  end

  def list_undelivered_orders
    orders = @order_repository.undelivered_orders
    @order_view.undelivered_orders(orders)
  end

  # Salesperson
  def list_my_orders(employee)
    orders = @order_repository.my_orders(employee)
    @order_view.list_my_orders(orders)
  end

  def list_my_undelivered_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @order_view.undelivered_orders(orders)
  end

  def mark_as_delivered(employee)
    list_my_orders(employee)
    index = @order_view.ask_for_order_index - 1
    my_orders = @order_repository.my_undelivered_orders(employee)
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end
end
