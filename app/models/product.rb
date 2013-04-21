class Product < ActiveRecord::Base
  belongs_to :factory
  attr_accessible :code, :description, :name, :factory, :point, :image_path

  has_many :variant, dependent: :destroy

end
