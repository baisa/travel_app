class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :title
      t.decimal :amount
      t.references :trip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
