module Client
  class ApplicationController < ApplicationController
    include Pundit
    before_action :client_authenticate

    layout "admin"

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    def client_authenticate
      authorize current_user, :client?
    end

    private

    def user_not_authorized(exception)
      render json: {error: exception.message }
    end
  end
end