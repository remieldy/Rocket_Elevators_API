class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.references :battery, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :building_type, null: false
      t.integer :number_of_floors, null: false
      t.string :status
      t.text :information
      t.text :notes
    end
  end
end
