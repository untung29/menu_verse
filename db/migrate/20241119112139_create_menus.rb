class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.string :label, null: false
      t.string :state, null: false
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
