require "csv"
require_relative "../models/order"

class OrderRepository
  attr_accessor :orders, :next_id, :orders_csv_path, :lp_repository,
                :customer_repository, :employee_repository

  def initialize(orders_csv_path, lp_repository, customer_repository, employee_repository)
    @orders_csv_path = orders_csv_path
    @lp_repository = lp_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1 if @orders.empty?
    load_csv if File.exist?(@orders_csv_path)
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def my_undelivered_orders(employee)
    @orders.select { |order| order.employee == employee && order.delivered == false }
  end

  def my_orders(employee)
    @orders.select { |order| order.employee == employee }
  end

  def undelivered_orders
    @orders.select { |order| order.delivered? == false }
  end

  def find(order_index)
    @orders[order_index]
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  private

  def save_csv
    CSV.open(@orders_csv_path, "wb") do |csv|
      csv << %w[id lp_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.lp.id, order.customer.id, order.employee.id, order.delivered]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@orders_csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:lp] = @lp_repository.find(row[:lp_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:delivered] = row[:delivered] == "true"
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end
end
