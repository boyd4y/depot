class LineItem < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  attr_accessible :ship_address, :ship_date, :status
end
