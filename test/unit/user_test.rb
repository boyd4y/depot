require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	test "user attributes must not be empty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:phone].any?
		assert user.errors[:password_digest].any?
	end

  	test "user attributes update" do
		user = User.new(phone: "15618965253", 
						password_digest: "User@123")

		assert user.invalid?, user.errors.full_messages.inspect
		assert user.errors[:phone].any?
		assert_equal ["has already been taken"], user.errors[:phone]

		user.phone = "110"
		assert user.valid?
	end
end
