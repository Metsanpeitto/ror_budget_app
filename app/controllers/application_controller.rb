class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_user!
    if user_signed_in?
      super
    elsif request.original_fullpath != landing_path &&
          request.original_fullpath != new_user_session_path &&
          request.original_fullpath != new_user_registration_path
      redirect_to landing_path, notice: 'Please Login to view that page!'
    end
  end
end
