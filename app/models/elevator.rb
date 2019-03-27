class Elevator < ApplicationRecord
    
    belongs_to :column

    before_save do
        slack_message()
    end

 def slack_message()
    notifier = Slack::Notifier.new (ENV["SLACK_API"]) do
        defaults channel: "#elevator_operations",
                 username: "Elevator_Status"
      end

      notifier.ping "The Elevator #{self.id} with Serial Number #{self.serial_number} changed status from #{self.status_was} to #{self.status}"
    
    end
end