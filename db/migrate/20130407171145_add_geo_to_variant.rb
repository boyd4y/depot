class AddGeoToVariant < ActiveRecord::Migration
  def change
    add_column :variants, :latitude, :float
    add_column :variants, :longitude, :float
  end
end
