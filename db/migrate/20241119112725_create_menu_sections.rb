class CreateMenuSections < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_sections do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :display_order, default: 0, null: false

      t.timestamps
    end

    # Add a unique composite index for the pair of menu_id and section_id
    add_index :menu_sections, [ :menu_id, :section_id ], unique: true
  end
end
