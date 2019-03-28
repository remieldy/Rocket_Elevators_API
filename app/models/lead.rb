require 'dropbox_api'
class Lead < ApplicationRecord
    belongs_to :customer, optional: true
    validates :full_name, presence: true
    validates :company_name, presence: true
    validates :email, presence: true

        def dropboxcreated
            if self.attachment
                #Connect to Dropbox with API Key
                client = DropboxApi::Client.new(ENV['DROPBOX_API'])
                
                #Lead informations
                content = self.attachment.tempfile
                f_name = self.attachment.original_filename
                b_name = self.company_name
                the_time = Time.now
                the_time.strftime "%Y-%m-%d %H:%M"
    
                #Check if business name exist in customer table
                c = Customer.find_by company_name: self.company_name
                
                #If extist
                if c != nil
                    self.customer_id = c.id
    
                # Check if there is a file attachment with the lead
                    if self.attachment.tempfile != nil
    
                    #Use a Begin/Rescue/End to catch the errors
                    begin
                        client.upload "/#{self.full_name}/#{the_time.strftime "%Y-%m-%d %H:%M"}_#{f_name}", content.read
                    rescue Exception
                        logger.info("ERROR DETECTED: Could not upload your files to Dropbox server.")
                    end
                        self.attachment = nil
                        self.save!
                    end
                end    
            end
        end
end