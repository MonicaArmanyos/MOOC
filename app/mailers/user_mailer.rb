class UserMailer < ActionMailer::Base
    default :from => "noreply@mydomain.com"
    def registration_confirmation(user)
        @user=user
        mail(:to => "#{user.name} < #{user.email}>" , :subject => "Email Confirmation")
    end
end
