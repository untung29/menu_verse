class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :type, null: false
      t.string :label, null: false
      t.string :description
      t.float :price, null: false

      t.timestamps
    end
  end
end
