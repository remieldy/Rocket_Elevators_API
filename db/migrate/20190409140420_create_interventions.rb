
# Caused by:
# Mysql2::Error: Duplicate entry 'marc_ant21@hotmail.com' for key 'index_users_on_email'
# /mnt/c/week9test/Rocket_Elevators_API/db/seeds.rb:42:in `block in <main>'
# /mnt/c/week9test/Rocket_Elevators_API/db/seeds.rb:32:in `<main>'
# Tasks: TOP => db:seed





class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :intervention do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :customer, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.references :battery, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :column, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
      t.references :elevator, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true


      # t.references :user, null: true
      t.date :interventionStart,  null: true
      t.date :intervention_finish,  null: true
      t.string :results, null: false
      t.text :report, optional: true
      t.text :statut,  null: false
      

    end
  end
end
