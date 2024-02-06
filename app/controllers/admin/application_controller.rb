module Admin
  class ApplicationController < ApplicationController
    include Pundit
    before_action :admin_authenticate

    layout "admin"

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    def admin_authenticate
      authorize current_user, :admin?
    end

    private

    def user_not_authorized(exception)
      render json: {error: exception.message }
    end
  end
end