class Factory < ActiveRecord::Base
  attr_accessible :code, :description, :email, :name, :logo, :scanimgurl, :company, :company_id

  has_many :variant, dependent: :destroy
  belongs_to :company
  
end
