class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.references :edible, polymorphic: true
      t.references :day, foreign_key: true
      t.string :slot
      t.float :amount

      t.timestamps
    end
  end
end
