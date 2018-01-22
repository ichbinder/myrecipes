class ChangeColumnDescriptioinInRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :descriptioin, :description
  end
end
