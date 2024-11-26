class AddStateToSections < ActiveRecord::Migration[8.0]
  def change
    add_column :sections, :state, :string, default: "active", null: false
  end
end
