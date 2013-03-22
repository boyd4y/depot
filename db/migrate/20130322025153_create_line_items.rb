class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :activity
      t.references :user
      t.integer :status
      t.string :ship_address
      t.date :ship_date

      t.timestamps
    end
    add_index :line_items, :activity_id
    add_index :line_items, :user_id
  end
end
