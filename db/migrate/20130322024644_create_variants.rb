class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :fullcode
      t.string :password
      t.references :factory
      t.references :product
      t.references :user
      t.integer :retry_count
      t.string :ipaddress

      t.timestamps
    end
    add_index :variants, :factory_id
    add_index :variants, :product_id
    add_index :variants, :user_id
    add_index :variants, :fullcode
  end
end
