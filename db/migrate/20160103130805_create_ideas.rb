class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :idea
      t.datetime :planned_at
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
