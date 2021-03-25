require 'io/console'

class SessionsView
  def ask_for_username
    puts "What's your username?"
    print "> "
    gets.chomp
  end

  def ask_for_password
    puts "What's the password?"
    print "> "
    STDIN.noecho(&:gets).chomp
  end

  def login_ok
    puts "Welcome!"
  end

  def wrong_credentials
    puts "Wrong credentials. Try again!"
  end
end
