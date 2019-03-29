# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable
  def name
    id 
  end 
end
