class CreateModifierGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :modifier_groups do |t|
      t.string :label, null: false
      t.integer :selection_required_min, default: 0, null: false
      t.integer :selection_required_max

      t.timestamps
    end
  end
end
