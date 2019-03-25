class CustomerNotifier < ActionMailer::Base
    default :from => 'remieldy@gmail.com'
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(customer)
      @customer = customer
      mail( :to => charleshebert1995@gmail.com
      :subject => 'Thanks for signing up for our amazing app' )
    end
  end

#   class CustomerNotifier < ActionMailer::Base
#     default :from => 'remieldy@gmail.com'
  
#     # send a signup email to the user, pass in the user object that   contains the user's email address
#     def send_signup_email(remieldy@gmail.com)
#       remieldy@gmail.com = remieldy@gmail.com
#       mail( :to => @remieldy@gmail.com,
#       :subject => 'Thanks for signing up for our amazing app' )
#     end
#   end