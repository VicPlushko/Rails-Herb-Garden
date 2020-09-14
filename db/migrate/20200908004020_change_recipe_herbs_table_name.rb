class ChangeRecipeHerbsTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :recipe_herbs, :remedy_herbs
  end
end
