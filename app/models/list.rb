class List < ApplicationRecord
    has_many :list_items
    has_many :items, through: :list_items
    has_many :user_lists
    has_many :users, through: :user_lists
    accepts_nested_attributes_for :items, :list_items

    validates :name, presence: true

    # Here we want to 
    def items_attributes=(item_attributes)
        item_attributes.values.each do |item_attributes|
            if item_attributes[:name] != ""
                item = Item.find_or_create_by(item_attributes)
                item.update(name: item.name.downcase)
                self.items << item
            end
        end
    end

    def list_items_attributes=(list_item_attributes)
        list_item_attributes.values.each do |list_item_attributes|
            list_item = ListItem.find_or_create_by(list_item_attributes)
            self.list_items << list_item
        end
    end
end
