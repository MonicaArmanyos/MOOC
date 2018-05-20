# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

 # GET /users/sign_in
#  def new
#   super
# end

# POST /users/sign_in
def create
 # super
  user= User.find_by_email(sign_in_params[:email])
  #if user && user.authenticatable_salt#(params[:password])
  if self.resource = warden.authenticate!(auth_options)
    if user.email_confirmed
      session[:user_id]=user.id
      redirect_to courses_url
    else
      flash[:error_login]="please activate your account"
      redirect_to new_user_session_url
    end
  else
    flash[:error_login]="Username or Password was wrong"
    redirect_to new_user_session_url
  end
end
  # DELETE /users/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
