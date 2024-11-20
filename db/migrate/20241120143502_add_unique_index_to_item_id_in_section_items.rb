class AddUniqueIndexToItemIdInSectionItems < ActiveRecord::Migration[8.0]
  def change
      # Remove the non-unique index if it exists
      remove_index :section_items, :item_id if index_exists?(:section_items, :item_id)

      # Add a unique index on item_id to enforce one to one relationship
      add_index :section_items, :item_id, unique: true
  end
end
