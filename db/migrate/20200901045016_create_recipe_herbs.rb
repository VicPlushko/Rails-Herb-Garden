class CreateRecipeHerbs < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_herbs do |t|
      t.string :quantity
      t.integer :herb_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
