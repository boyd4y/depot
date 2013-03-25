require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "lineitem attributes update" do
		lineitem1 = line_items(:one)
		lineitem2 = line_items(:two)
		user1 = users(:one)
		assert user1.joinedActivity(lineitem1.activity_id)
		assert !user1.joinedActivity(lineitem2.activity_id)
	end
end
