class User < ActiveRecord::Base
  attr_accessible :password_digest, :phone
  validates :phone, presence: true, uniqueness: true
  has_secure_password
end
