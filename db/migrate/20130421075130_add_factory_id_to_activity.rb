class AddFactoryIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :factory_id, :integer
  end
end
