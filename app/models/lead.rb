class Lead < ApplicationRecord
    belongs_to :customer, optional: true
    validates :full_name, presence: true
    validates :company_name, presence: true
    validates :email, presence: true
end
