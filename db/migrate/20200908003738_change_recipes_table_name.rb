class ChangeRecipesTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :recipes, :remedies
  end
end
