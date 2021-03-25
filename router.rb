# TODO: implement the router of your app.
class Router
  def initialize(lps_controller, customers_controller, sessions_controller, orders_controller)
    @lps_controller = lps_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    puts "         --         "
    puts "Welcome to LP Store!"
    while @running
      @current_user = @sessions_controller.login
      while @current_user
        if @current_user.manager?
          display_manager_options
          action = gets.chomp.to_i
          print `clear`
          route_manager_action(action)
        else
          display_salesperson_options
          action = gets.chomp.to_i
          print `clear`
          route_salesperson_action(action)
        end
      end
    end
  end

  private

  def route_manager_action(action)
    case action
    when 1 then @lps_controller.list
    when 2 then @lps_controller.add
    when 3 then @lps_controller.find
    when 4 then @lps_controller.edit
    when 5 then @lps_controller.destroy
    when 6 then @customers_controller.list
    when 7 then @customers_controller.add
    when 8 then @customers_controller.find
    when 9 then @customers_controller.edit
    when 10 then @customers_controller.destroy
    when 11 then @orders_controller.add
    when 12 then @orders_controller.list_undelivered_orders
    when 13 then logout
    when 14 then stop
    else
      puts "Please choose from 1 to 14"
    end
  end

  def route_salesperson_action(action)
    case action
    when 1 then @orders_controller.mark_as_delivered(@current_user)
    when 2 then @orders_controller.list_my_undelivered_orders(@current_user)
    when 3 then @orders_controller.list_my_orders(@current_user)
    when 4 then logout
    when 5 then stop
    else
      puts "Please choose from 1 to 5"
    end
  end

  def display_manager_options
    puts ""
    puts "What do you want to do next?"
    puts "1 - List all LPs"
    puts "2 - Create a new LP"
    puts "3 - Find a LP"
    puts "4 - Edit an existing LP"
    puts "5 - Delete a LP"
    puts "6 - List all customers"
    puts "7 - Create a new customer"
    puts "8 - Find a customer"
    puts "9 - Edit an existing customer"
    puts "10 - Delete a customer"
    puts "11 - Create an order"
    puts "12 - List undelivered orders"
    puts "13 - Logout"
    puts "14 - Exit program"
  end

  def display_salesperson_options
    puts ""
    puts "What do you want to do next?"
    puts "1 - Mark a delivery as done"
    puts "2 - List your undelivered orders"
    puts "3 - List all your orders"
    puts "4 - Logout"
    puts "5 - Exit"
  end

  def logout
    @current_user = nil
  end

  def stop
    @current_user = nil
    @running = false
    puts "Bye bye!"
  end
end
