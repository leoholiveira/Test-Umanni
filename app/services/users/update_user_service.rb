module Users
  class UpdateUserService
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def call
      @user = User.find(params[:id])

      if password_blank?
        @user.update(user_params)
        @user.save(validate: false)
      else
        @user.update(user_params)
      end
    end

    private

    def password_blank?
      params[:user][:password].blank? && params[:user][:password_confirmation].blank?
    end

    def user_params
      params.require(:user).permit(:fullname, :email, :avatar_image, :user_type, :password, :password_confirmation)
    end
  end
end
