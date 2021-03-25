require "csv"
require_relative "../models/employee"

class EmployeeRepository
  attr_writer :employees
  attr_accessor :next_id, :csv_file

  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1 if @employees.empty?
    load_csv if File.exist?(@csv_file)
  end

  def all_salespeople
    @employees.select { |employee| employee.role == "salespeople" }
  end

  def find(index)
    @employees.find { |employee| employee.id == index }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:username] = row[:username]
      row[:password] = row[:password]
      row[:role] = row[:role]
      @employees << Employee.new(row)
    end
    @next_id = @employees.last.id + 1 unless @employees.empty?
  end
end
