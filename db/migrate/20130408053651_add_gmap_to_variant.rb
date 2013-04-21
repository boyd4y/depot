class AddGmapToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :gmaps, :boolean
  end
end
