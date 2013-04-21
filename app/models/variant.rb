class Variant < ActiveRecord::Base
  belongs_to :factory
  belongs_to :product
  belongs_to :user
  attr_accessible :fullcode, :ipaddress, :password, :retry_count, :checked, :factory, :user_id, :user, :product, :latitude, :longitude, :gmaps

  acts_as_gmappable :process_geocoding => false

  validates :fullcode, presence: true, uniqueness: true
  validates :password, presence: true
  
  def verify!(verifiedBy, verifyPassword, latitude, longitude)
  	if (self.password == verifyPassword)
      return self.user && self.user.id == verifiedBy.id if self.checked
      self.user = verifiedBy
  		self.checked = true
      self.latitude = latitude
      self.longitude = longitude
  		save!
  	else
  		self.user = verifiedBy
  		self.retry_count += 1
  		save!
      return false
  	end
  end

 def gmaps4rails_title
    # add here whatever text you desire
    product.name
  end
  
end
