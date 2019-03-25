class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.references :address, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :customer, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :full_name_admin_person
      t.string :email_admin_person
      t.string :phone_number_admin_person
      t.string :full_name_tech_person
      t.string :email_tech_person
      t.string :phone_number_tech_person
    end
  end
end
