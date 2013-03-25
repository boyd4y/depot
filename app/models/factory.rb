class Factory < ActiveRecord::Base
  attr_accessible :code, :description, :email, :name

  has_many :variant, dependent: :destroy
  
end
