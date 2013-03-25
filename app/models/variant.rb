class Variant < ActiveRecord::Base
  belongs_to :factory
  belongs_to :product
  belongs_to :user
  attr_accessible :fullcode, :ipaddress, :password, :retry_count, :checked, :factory, :user, :product

  validates :fullcode, presence: true, uniqueness: true
  validates :password, presence: true

  # after_initialize :after_initialize

  # def after_initialize
  # 	checked = false
  # 	retry_count = 0
  # end

  # def checked
  #   attributes[:checked] || false
  # end

  # def retry_count
  #   attributes[:retry_count] || 0
  # end
  
  def verify!(verifiedBy, verifyPassword)
  	if (self.password == verifyPassword)
      return self.user && self.user.id == verifiedBy.id if self.checked
      self.user = verifiedBy
  		self.checked = true
  		save!
  	else
  		self.user = verifiedBy
  		self.retry_count += 1
  		save!
      return false
  	end
  end
end
