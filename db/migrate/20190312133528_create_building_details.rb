<<<<<<< HEAD
class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :information
      t.string :valeur
    end
  end
end
=======
class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :info_key
      t.string :value
    end
  end
end
>>>>>>> 4fb2435f1b6ce87e06de761d11f5d3429465ebe4
