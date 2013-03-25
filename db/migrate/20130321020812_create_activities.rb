class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :imageurl
      t.boolean :neverexpired
      t.date :validfrom
      t.date :validto
      t.integer :status

      t.timestamps
    end
  end
end
