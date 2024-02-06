module Users
  class CreateUserService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      @user = User.new(user_params)
      @user.save
      @user
    end

    def user_params
      params.require(:user).permit(:fullname, :email, :avatar_image, :user_type, :password, :password_confirmation)
    end
  end
end
