class ChangeDataTypeInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column :recipes, :cooking_time, :decimal, using: 'EXTRACT(EPOCH FROM cooking_time)::numeric'
    change_column :recipes, :preparation_time, :decimal, using: 'EXTRACT(EPOCH FROM preparation_time)::numeric'
  end
end
