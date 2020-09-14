class ChangeColumnNameInRemedyHerbs < ActiveRecord::Migration[6.0]
  def change
    rename_column :remedy_herbs, :recipe_id, :remedy_id
  end
end
