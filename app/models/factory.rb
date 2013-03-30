class Factory < ActiveRecord::Base
  attr_accessible :code, :description, :email, :name, :logo, :scanimgurl

  has_many :variant, dependent: :destroy
  
end
