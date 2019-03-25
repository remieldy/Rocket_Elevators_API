class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.references :column, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.integer :serial_number, null: false
      t.string :model_type, null: false
      t.string :building_type, null: false
      t.string :status
      t.date :date_of_instal
      t.date :date_of_inspect
      t.string :inspect_certificate
      t.text :information
      t.text :notes
    end
  end
end
