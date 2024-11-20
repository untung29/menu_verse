class CreateSectionItems < ActiveRecord::Migration[8.0]
  def change
    create_table :section_items do |t|
      t.references :section, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :display_order, default: 0, null: false

      t.timestamps
    end

    # Add a unique item index to enforce one to one relationship with item model
    add_index :section_items, :item_id, unique: true
  end
end
