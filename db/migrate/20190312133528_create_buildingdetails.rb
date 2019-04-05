class CreateBuildingdetails < ActiveRecord::Migration[5.2]
  def change
    create_table :buildingdetails do |t|
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :information
      t.string :valeur
    end
  end
end
