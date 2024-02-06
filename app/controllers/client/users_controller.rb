module Client
  class UsersController < Client::ApplicationController
    def edit
      @user = authorize User.find(params[:id])
    end

    def update
      if Users::UpdateUserService.new(params).call
        flash[:notice] = "Upload success"
        redirect_to '/client/dashboard'
      else
        render 'edit', status: :unprocessable_entify
      end
    end

    def destroy
      if Users::DeleteUserService.new(params[:id]).call
        flash[:notice] = "Delete success"
        redirect_to '/client/dashboard'
      else
        redirect_to '/client/dashboard', status: :unprocessable_entify
      end
    end
  end
end