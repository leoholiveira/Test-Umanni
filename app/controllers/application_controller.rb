class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  protected 
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :avatar_image]) 
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      dashboard_index_path
    else
      '/client/dashboard'
    end
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    err_message = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    render json: { message: err_message }, status: :unauthorized
  end
end
