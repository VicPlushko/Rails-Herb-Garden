class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.string :directions
      t.integer :user_id

      t.timestamps
    end
  end
end
