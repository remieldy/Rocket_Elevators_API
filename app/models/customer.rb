class Customer < ApplicationRecord
    belongs_to :address
    belongs_to :user, optional: true
    has_many :buildings

    def name
        full_name_contact_person
    end
end
