class Variant < ActiveRecord::Base
  belongs_to :factory
  belongs_to :product
  belongs_to :user
  attr_accessible :fullcode, :ipaddress, :password, :retry
end
