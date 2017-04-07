class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :user
      t.float :serves

      t.timestamps
    end
  end
end
