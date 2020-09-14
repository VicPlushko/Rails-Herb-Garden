class ChangeColumnNameInRecipes < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :name, :title
  end
end
