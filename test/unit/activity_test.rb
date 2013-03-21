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
		assert activity.errors[:image_url].any?
	end
end
