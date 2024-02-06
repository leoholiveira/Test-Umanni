module Client
  class DashboardController < Client::ApplicationController
    def index
      @clients = User.where(user_type: 'client').count
      @admins = User.where(user_type: 'admin').count
      @total = @clients + @admins

      respond_to do |format|
        format.html
        format.json { render json: { 
          clients: @clients,
          admins: @admins,
          total: @total
        }}
      end
    end
  end
end