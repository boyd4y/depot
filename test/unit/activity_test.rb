require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "activity attributes must not be empty" do
		activity = Activity.new
		assert activity.invalid?
		assert activity.errors[:title].any?
		assert activity.errors[:description].any?
		assert activity.errors[:imageurl].any?
	end

	test "activity expired and joinable" do
		# isNotExpired
		assert activities(:neverexpired_activity).isNotExpired
		assert activities(:notexpired_activity).isNotExpired
		assert !activities(:expired_activity_joinable).isNotExpired
		assert !activities(:expired_activity_notjoinable).isNotExpired
		assert activities(:notexpired_activity_notjoinable).isNotExpired
		
		assert activities(:neverexpired_activity).canbeJoined
		assert activities(:notexpired_activity).canbeJoined
		assert !activities(:expired_activity_joinable).canbeJoined
		assert !activities(:expired_activity_notjoinable).canbeJoined
		assert !activities(:notexpired_activity_notjoinable).canbeJoined
	end
end
