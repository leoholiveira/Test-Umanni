module Admin
  class UsersController < Admin::ApplicationController
    skip_before_action :verify_authenticity_token, only: [:import_csv]

    def index
      respond_to do |format|
        format.html
        format.json { render json: Users::SearchUserService.new(params['type']).call }
      end
    end

    def new
      @user = User.new
    end

    def create
      response = Users::CreateUserService.new(params).call
      if response
        flash[:notice] = "created success"
        redirect_to dashboard_index_path
      else
        render 'new', status: :unprocessable_entify
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      if Users::UpdateUserService.new(params).call
        flash[:notice] = "Upload success"
        redirect_to dashboard_index_path
      else
        render 'edit', status: :unprocessable_entify
      end
    end

    def destroy
      if Users::DeleteUserService.new(params[:id]).call
        flash[:notice] = "Delete success"
        redirect_to dashboard_index_path
      else
        redirect_to dashboard_index_path, status: :unprocessable_entify
      end
    end

    def import_csv
      if Users::ImportUsersService.new(params[:file]).call
        render json: {success: true}
      else
        render json: {success: false}
      end
    end
  end
end

