class User < ActiveRecord::Base
	attr_accessible :password, :phone, :password_confirmation, :credit
	validates :phone, presence: true, uniqueness: true
	validates :password, :password_confirmation, presence: true
	# validates_presence_of :password, :password_confirmation, :on => :create

	has_secure_password
	
	has_many :line_items, dependent: :destroy
	has_many :variant, dependent: :destroy

	after_initialize :after_initialize

	def after_initialize
	end

  	def as_json(options={})
    	super(options.merge({ :only => [:id, :phone, :credit] }))
	end

	def joinedActivity(activity_id)
		line_items.where(activity_id: activity_id).any?
	end

	def addCredit!(changedNumber)
		self.credit += changedNumber
		update_attribute('credit', self.credit)
		return true
	end

	def removeCredit!(changedNumber)
		if self.credit > changedNumber
			self.credit -= changedNumber
			update_attribute('credit', self.credit)
			return true
		end

		return false
	end
end
