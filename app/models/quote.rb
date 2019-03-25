class Quote < ApplicationRecord
    validates :full_name, presence: true
    validates :number_of_elevators, presence: true 
    validates :service_level, presence: true 
    validates :total_cost, presence: true 
end
