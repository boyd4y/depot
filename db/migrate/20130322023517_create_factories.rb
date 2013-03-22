class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
