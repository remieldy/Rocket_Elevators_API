# Load the Rails application.
require_relative 'application'
#config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
# Initialize the Rails application.
Rails.application.initialize!


  ActionMailer::Base.smtp_settings = {
    :user_name => 'user_name',
    :password => 'your_password',
    :domain => 'your_domain.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

