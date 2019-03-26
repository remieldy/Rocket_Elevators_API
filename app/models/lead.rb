<<<<<<< HEAD
class Lead < ApplicationRecord
    belongs_to :customer, optional: true
    validates :full_name, presence: true
    validates :company_name, presence: true
    validates :email, presence: true
    
end
=======
class Lead < ApplicationRecord
    belongs_to :customer, optional: true
    validates :full_name, presence: true
    validates :company_name, presence: true
    validates :email, presence: true
end
>>>>>>> 4fb2435f1b6ce87e06de761d11f5d3429465ebe4
