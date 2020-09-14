class RemoveColumnFromHerbs < ActiveRecord::Migration[6.0]
  def change
    remove_column :herbs, :user_id
  end
end
