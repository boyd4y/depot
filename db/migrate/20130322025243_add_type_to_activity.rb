class AddTypeToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :type, :integer
  end
end
