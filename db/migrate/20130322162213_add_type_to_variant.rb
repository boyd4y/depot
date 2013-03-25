class AddTypeToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :checked, :boolean
  end
end
