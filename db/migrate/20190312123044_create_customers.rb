class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :address, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :user, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.date :date_of_creation
      t.string :company_name, null: false
      t.string :full_name_contact_person
      t.string :phone_number_contact_person
      t.string :email_contact_person
      t.text :company_description
      t.string :full_name_service_person
      t.string :phone_number_service_person
      t.string :email_service_person
    end
  end
end
