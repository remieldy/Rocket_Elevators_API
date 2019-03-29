class CustomerNotifier < ActionMailer::Base
  default :from => 'support@codeboxx.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  
  def send_signup_email(customer)
    @customer = customer
    mail( :to => 'martino_1997@hotmail.ca'
    :subject => 'Thanks for signing up for our amazing appy' )
  end
end