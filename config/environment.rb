# Load the Rails application.
require_relative 'application'
#config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
# Initialize the Rails application.
Rails.application.initialize!


<<<<<<< HEAD
 ActionMailer::Base.smtp_settings = {
   :user_name => 'user_name',
   :password => 'password',
   :domain => 'yourdomain.com',
   :address => 'smtp.sendgrid.net',
   :port => 587,
   :authentication => :plain,
   :enable_starttls_auto => true
 }
=======
  ActionMailer::Base.smtp_settings = {
    :user_name => 'user_name',
    :password => 'your_password',
    :domain => 'your_domain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

>>>>>>> 60185e4ff7dfe460020bd4d2e29f41935fd1c5f8
