class Address < ApplicationRecord
    def name
        number_street
    end

    def display_address
        self.number_street + " " + self.city + " " + self.postal_code
    end
end
