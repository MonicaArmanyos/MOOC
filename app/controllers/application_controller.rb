class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:password,:date_of_birth,:gender,:profile_picture,:role])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password,:remember_me])
  end
end
