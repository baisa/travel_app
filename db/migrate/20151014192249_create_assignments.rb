class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :participant, index: true, foreign_key: true
      t.references :todo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
