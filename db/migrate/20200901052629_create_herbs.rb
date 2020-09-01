class CreateHerbs < ActiveRecord::Migration[6.0]
  def change
    create_table :herbs do |t|
      t.string :name
      t.string :latin_name
      t.string :family
      t.string :medicinal_parts
      t.string :taste
      t.string :energetics
      t.string :action
      t.string :ideal_for
      t.string :application
      t.string :dosage
      t.string :considerations
      t.integer :user_id

      t.timestamps
    end
  end
end
