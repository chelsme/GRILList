class AddImgUrlToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :img_url, :string
  end
end
