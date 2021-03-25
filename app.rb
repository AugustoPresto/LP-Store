# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/repositories/lp_repository'
require_relative 'app/controllers/lps_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/orders_controller'
require_relative 'router'

lp_csv_file   = File.join(__dir__, 'data/lps.csv')
lp_repository = LpRepository.new(lp_csv_file)
lps_controller = LpsController.new(lp_repository)
customer_csv_file   = File.join(__dir__, 'data/customers.csv')
customer_repository = CustomerRepository.new(customer_csv_file)
customers_controller = CustomersController.new(customer_repository)
employee_csv_file   = File.join(__dir__, 'data/employees.csv')
employee_repository = EmployeeRepository.new(employee_csv_file)
sessions_controller = SessionsController.new(employee_repository)
order_csv_file = File.join(__dir__, 'data/orders.csv')
order_repository = OrderRepository.new(order_csv_file, lp_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(lp_repository, customer_repository, employee_repository, order_repository)

router = Router.new(lps_controller, customers_controller, sessions_controller, orders_controller)

# Start the app
router.run
