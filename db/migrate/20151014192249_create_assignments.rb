class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :participant_id
      t.integer :todo_id
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
