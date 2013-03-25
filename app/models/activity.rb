class Activity < ActiveRecord::Base
  attr_accessible :description, :imageurl, :neverexpired, :status, :title, :validfrom, :validto, :point

  validates :title, :description, presence: true
  validates :title, uniqueness: true

  validates :imageurl, allow_blank: false, format: {
	with: %r{\.(gif|jpg|png)\Z}i,
	message: 'must be a URL for GIF, JPG or PNG image.'
  }

  has_many :line_item, dependent: :destroy

# status:
# 1, joinedable
# 2, notjoinedable
  def canbeJoined
  	isNotExpired && (status == 1)  
  end

  def isNotExpired
  	neverexpired || !validto.past?
  end
end
