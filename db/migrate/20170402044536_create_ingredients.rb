class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe
      t.references :food
      t.float :amount

      t.timestamps
    end
  end
end
