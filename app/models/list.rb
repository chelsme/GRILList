class List < ApplicationRecord
    has_many :list_items
    has_many :items, through: :list_items
    has_many :user_lists
    has_many :users, through: :user_lists
    accepts_nested_attributes_for :items

    # Here we want to 
    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attributes|
            new_item = Item.find_or_create_by(item_attributes)
            self.items << new_item
        end
    end
end
