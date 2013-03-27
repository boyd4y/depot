class AddLogoToFactory < ActiveRecord::Migration
  def change
    add_column :factories, :logo, :string
  end
end
