class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.references :user
      t.string :name
      t.string :unit

      t.timestamps
    end
  end
end
