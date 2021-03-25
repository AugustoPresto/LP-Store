require_relative '../views/sessions_view'
require_relative '../repositories/employee_repository'

class SessionsController
  attr_reader :employee_repository

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    username = @sessions_view.ask_for_username
    password = @sessions_view.ask_for_password
    current_user = @employee_repository.find_by_username(username)
    if current_user && current_user.password == password
      @sessions_view.login_ok
      current_user
    else
      @sessions_view.wrong_credentials
      login
    end
  end
end
