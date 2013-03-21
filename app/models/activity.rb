class Activity < ActiveRecord::Base
  attr_accessible :description, :image_url, :neverexpired, :status, :title, :validfrom, :validto
end
