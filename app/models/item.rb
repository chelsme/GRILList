class Item < ApplicationRecord
    has_many :recipe_items
    has_many :recipes, through: :recipe_items
    has_many :list_items
    has_many :lists, through: :list_items
end
