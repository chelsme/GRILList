class RecipeItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :item

  def recipe_item_name
    id = self.item_id
    Item.find(id).name
  end
end
