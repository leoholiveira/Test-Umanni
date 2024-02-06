class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def index?
    
  end

  def update?
    current_user.admin? || current_user.user == user
  end

  def delete?
    current_user.admin? || current_user.user == user
  end

  def change_role?
    current_user.admin?
  end

  def create?
    current_user.admin?
  end

  def show?
    current_user.admin? || current_user.user == user
  end

  def destroy?
    current_user.admin? || current_user.user == user
  end

  def admin?
    current_user.admin?
  end

  def client?
    current_user.client?
  end

  def edit?
    current_user.admin? || current_user.id == user.id
  end
end
