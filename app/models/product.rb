class Product < ActiveRecord::Base
  belongs_to :factory
  attr_accessible :code, :description, :name, :factory, :point

  has_many :variant, dependent: :destroy

end
