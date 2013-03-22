class Product < ActiveRecord::Base
  belongs_to :factory
  attr_accessible :code, :description, :name
end
