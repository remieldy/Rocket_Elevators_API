<<<<<<< HEAD
class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :user, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.string :building_type, null: false
      t.string :status
      t.date :date_of_install
      t.date :date_of_inspect
      t.integer :inspect_certificate
      t.text :information
      t.text :notes
    end
  end
end
=======
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
>>>>>>> 4fb2435f1b6ce87e06de761d11f5d3429465ebe4
