class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type, null: false
      t.string :status
      t.string :entity, null: false
      t.string :number_street, null: false
      t.string :apt_number
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :country, null: false
      t.text :notes
    end
  end
end
