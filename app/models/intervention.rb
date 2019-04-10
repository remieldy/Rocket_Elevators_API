
# https://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html

# The belongs_to association is always used in the model that has the foreign key.

# author ou user parce que mes columns sont appelle user pour mes migrates
class Intervention < ApplicationRecord
    belongs_to :author 
    belongs_to :customer
    belongs_to :building
    belongs_to :battery
    belongs_to :column
    belongs_to :elevator
    belongs_to :author
    has_many :interventionStart
    has_many :intervention_finish
    has_many :results
    has_many :report
    has_many :status
end
 