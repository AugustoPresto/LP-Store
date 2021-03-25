require "csv"
require_relative "../models/customer"

class CustomerRepository
  attr_writer :customers
  attr_accessor :next_id, :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1 if @customers.empty?
    load_csv if File.exist?(@csv_file)
  end

  def create(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  def destroy(customer_index)
    @customers.delete_at(customer.id)
    save_csv
  end

  def all
    @customers
  end

  def find(index)
    @customers.select { |customer| customer.id == index }.first
  end

  def edit(selected_customer, customer_name, customer_email, customer_address)
    @customers[selected_customer].name = customer_name
    @customers[selected_customer].email = customer_email
    @customers[selected_customer].address = customer_address
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id name email address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.email, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:email] = row[:email]
      row[:address] = row[:address]
      @customers << Customer.new(row)
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end
end
