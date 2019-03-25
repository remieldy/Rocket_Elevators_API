class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :user, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.string :building_type, null: false
      t.string :status
      t.date :date_of_instal
      t.date :date_of_inspect
      t.integer :inspect_certificate
      t.text :information
      t.text :notes
    end
  end
end
