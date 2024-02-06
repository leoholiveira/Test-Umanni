class Admin::ApplicationPolicy
  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def admin?
    current_user.admin?
  end
end