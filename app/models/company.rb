class Company < ActiveRecord::Base
  attr_accessible :description, :email, :name, :password
  has_many :factory, dependent: :destroy
end
