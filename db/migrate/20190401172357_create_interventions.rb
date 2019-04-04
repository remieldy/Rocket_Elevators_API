class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.belongs_to :user, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.belongs_to :building, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.belongs_to :battery, index: true, optional: true
      t.belongs_to :column, index: true, optional: true
      t.belongs_to :elevator, index: true, optional: true
      t.datetime :intervention_start, require: false    
      t.datetime :intervention_finish, optional: true 
      t.integer :intervention_result, optional: false 
      t.text :report, optionnal: true 
      t.integer :status, optionnal: false

      t.timestamps
    end
  end
end
