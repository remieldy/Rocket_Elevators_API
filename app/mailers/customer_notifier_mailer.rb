class CustomerNotifier < ActionMailer::Base
    default :from => 'charleshebert1995@gmail.com'
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(customer)
      @customer = customer
      mail( :to => 'remieldy@hotmail.com'
      :subject => 'Thanks for signing up for our amazing appyiiiiiiiiiiiiiiiiiiiiiiiiii' )
    end
  end

