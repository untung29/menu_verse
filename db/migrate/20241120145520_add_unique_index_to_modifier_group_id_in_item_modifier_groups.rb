class AddUniqueIndexToModifierGroupIdInItemModifierGroups < ActiveRecord::Migration[8.0]
  def change
      # Remove the non-unique index if it exists
      remove_index :item_modifier_groups, :modifier_group_id if index_exists?(:item_modifier_groups, :modifier_group_id)

      # Add a unique index on item_id to enforce one to one relationship
      add_index :item_modifier_groups, :modifier_group_id, unique: true
  end
end
