class AddUniqueIndexToSectionIdInMenuSections < ActiveRecord::Migration[8.0]
  def change
    # Remove the non-unique index if it exists
    remove_index :menu_sections, :section_id if index_exists?(:menu_sections, :section_id)

    # Add a unique index on section_id to enforce one to one relationship
    add_index :menu_sections, :section_id, unique: true
  end
end
