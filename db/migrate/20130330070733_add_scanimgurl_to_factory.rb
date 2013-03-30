class AddScanimgurlToFactory < ActiveRecord::Migration
  def change
    add_column :factories, :scanimgurl, :string
  end
end
