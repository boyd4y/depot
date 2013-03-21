class Activity < ActiveRecord::Base
  attr_accessible :description, :image_url, :neverexpired, :status, :title, :validfrom, :validto

  validates :title, :description, presence: true
  validates :title, uniqueness: true

  validates :image_url, allow_blank: false, format: {
	with: %r{\.(gif|jpg|png)\Z}i,
	message: 'must be a URL for GIF, JPG or PNG image.'
  }

end
