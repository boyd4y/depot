class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :email
      t.string :password

      t.timestamps
    end

    add_index :companies, :name
    add_index :companies, :email
  end
end
