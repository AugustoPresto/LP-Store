class OrderView
  def ask_for(string)
    puts "#{string}?"
    gets.chomp.to_i
  end

  def undelivered_orders(orders)
    orders.each do |order|
      puts "#{order.lp.artist} - #{order.lp.title} - #{order.employee.username} - #{order.customer.name} - #{order.customer.address}"
    end
  end

  def list_my_orders(orders)
    orders.each_with_index do |order, index|
      delivered = order.delivered? ? "[x]" : "[ ]"
      puts "#{index + 1} - #{delivered} #{order.lp.artist} - #{order.lp.title} - #{order.customer.name}"
    end
  end

  def ask_for_order_index
    puts "In what index is the order?"
    gets.chomp.to_i
  end
end
