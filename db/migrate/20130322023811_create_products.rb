class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :code
      t.references :factory

      t.timestamps
    end
    add_index :products, :factory_id
  end
end
