class CreateRecipeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_items do |t|
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :item_quantity

      t.timestamps
    end
  end
end
