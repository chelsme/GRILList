class CreateListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :list_items do |t|
      t.belongs_to :list, foreign_key: true
      t.belongs_to :item, foreign_key: true
      t.integer :item_quantity

      t.timestamps
    end
  end
end
