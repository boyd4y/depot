class AddPointToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :point, :integer
  end
end
