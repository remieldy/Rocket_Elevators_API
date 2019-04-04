class Elevator < ApplicationRecord
    
    belongs_to :column

#     after_commit do 
#         if status == 'intervention'
#             sms_elevator()
#         end
#     end
#     before_save do
#         slack_message()
#     end

#  def slack_message()
#     notifier = Slack::Notifier.new (ENV["SLACK_API"]) do
#         defaults channel: "#elevator_operations",
#                  username: "TeamRemi"
#       end

#       notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
    
#     end
end


    
    def sms_elevator()
        require 'twilio-ruby'        
        @client = Twilio::REST::Client.new(ENV['TWILIO_API'], ENV['TWILIO_AUTH'])
        message = @client.messages.create(
                                from: '+15877416030',
                                body: "Status of elevator number #{self.id} of column number #{self.column.id} of battery number #{self.column.battery.id} of building at #{self.column.battery.building.address.number_street} in #{self.column.battery.building.address.city} passed to INTERVENTION",
                                to: "+1#{self.column.battery.building.phone_number_admin_person}"
                                )
        
        puts message.sid
    end 
