# README

* Ruby version: 2.5.1
* Rails version: Rails 5.1.6
* Database: mysql2

* Tests: There are 3 model test cases, and 2 controller test cases (although they are in courses_controller.rb, I have modified them to suit my project)

* All these gems are used :
-devise
- acts_as_votable
- cancan
- carrierwave
- activeadmin
- ckeditor_rails
in addition to the following gems for bootstap and design
gem 'bootstrap-sass'
gem 'jquery-rails'

* Deployment instructions:
Note:
on signing up: it's required to enter a valid email and password because there is email confirmation.
-In config/development.rb in the hash of: config.action_mailer.smtp_settings please enter an email and password from which the application will send emails to users.
-If you aren't logged in the website will redirect you to login first 
To login in admin panel 
use : email: 'admin@example.com', password: 'password'
 
 
 
 
 
 Thanks for reading :)

