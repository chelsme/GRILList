class Recipe < ApplicationRecord
    has_many :recipe_items
    has_many :items, through: :recipe_items
    belongs_to :user
    accepts_nested_attributes_for :items, :recipe_items

    # Here we want to 
    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attributes|
            if item_attributes[:name] != ""
                item = Item.find_or_create_by(item_attributes)
                self.items << item
            end
        end
    end

    def recipe_items_attributes=(recipe_item_attributes)
        recipe_item_attributes.values.each do |recipe_item_attributes|
            recipe_item = RecipeItem.find_or_create_by(recipe_item_attributes)
            self.recipe_items << recipe_item
        end
    end

    def quantity
        id = self.id
        RecipeItem.find_by(recipe_id: id).item_quantity
    end
end