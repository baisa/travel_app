class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :task
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
