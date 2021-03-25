class CustomerView
  def display(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} - #{customer.email} - #{customer.address}"
    end
  end

  def ask_for_customer_name
    puts "What's the customer's name?"
    gets.chomp
  end

  def ask_for_customer_email
    puts "What's the customer's email?"
    gets.chomp
  end

  def ask_for_customer_address
    puts "What's the customer's address?"
    gets.chomp
  end

  def ask_for_customer_index
    puts "In what index is the customer?"
    gets.chomp.to_i
  end

  def show_customer(selected_customer)
    puts "#{selected_customer.id}. #{selected_customer.name} - #{selected_customer.email} - #{selected_customer.address}"
  end

  def ask_for_new_customer_name
    puts "What's the customer's new name?"
    gets.chomp
  end

  def ask_for_new_customer_email
    puts "What's the customer's new email?"
    gets.chomp
  end

  def ask_for_new_customer_address
    puts "What's the customer's new address?"
    gets.chomp
  end
end
