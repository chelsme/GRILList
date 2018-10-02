class List < ApplicationRecord
    has_many :list_items
    has_many :items, through: :list_items
    has_many :user_lists
    has_many :users, through: :user_lists

    # Here we want to 
    def items_attributes=(item_hash)
        byebug
        item_hash.value.each do |item|
            self.item = Item.find_or_create_by(name: item[:name])
            self.item.update(item)
        end
    end
end
