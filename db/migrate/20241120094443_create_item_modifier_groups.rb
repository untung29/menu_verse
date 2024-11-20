class CreateItemModifierGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :item_modifier_groups do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true

      t.timestamps
    end

    # Add a unique item index to enforce one to one relationship with modifier group model
    add_index :item_modifier_groups, :modifier_group_id, unique: true
  end
end
