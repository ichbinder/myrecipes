class ChangeColumnInRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes, :email, :descriptioin
    change_column :recipes, :descriptioin, :text
  end
end
