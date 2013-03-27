class Factory < ActiveRecord::Base
  attr_accessible :code, :description, :email, :name, :logo

  has_many :variant, dependent: :destroy
  
end
