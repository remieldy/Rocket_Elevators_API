class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :department
      t.string :full_name 
      t.string :company_name 
      t.string :email 
      t.string :phone_number 
      t.integer :number_of_apartments 
      t.integer :number_of_floors 
      t.integer :number_of_basements 
      t.integer :number_of_parking 
      t.integer :number_of_stores 
      t.integer :max_occupancy_per_floor 
      t.integer :hours_of_activity 
      t.string :service_level 
      t.integer :number_of_elevators
      t.integer :installation_cost
      t.float :total_cost 
      t.timestamps
    end
  end
end
