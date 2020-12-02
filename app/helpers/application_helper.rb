module ApplicationHelper
  def authenticate_admin!
    authenticate_conta!
    current_conta.is_admin?
  end
end
