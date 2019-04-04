class Intervention < ApplicationRecord
    belongs_to :user
    belongs_to :building
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true

    enum intervention_result: [:Success, :Failed, :Incompleted]
    enum status: [:Pending, :InProgress, :Interrupted, :Resumed, :Completed]
    
end
