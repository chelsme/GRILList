class Recipe < ApplicationRecord
    has_many :recipe_items
    has_many :items, through: :recipe_items
    belongs_to :user
end
