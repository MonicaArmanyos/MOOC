class UsersController < InheritedResources::Base
  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  # end
# GET /users/:id/confirm_email
    def confirm_email
        user=User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          flash[:success]="Your account has now been confirmed.You can login now !"
          redirect_to new_user_session_url
        else 
          flash[:error]="Email doesn't exist"
          redirect_to  new_user_registration_url
        end
      end
    private
  
  end
  
  