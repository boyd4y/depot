require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  	test "user attributes must not be empty" do
		user = User.new
		assert user.invalid?
		assert user.errors[:phone].any?
		assert user.errors[:password].any?
	end

  	test "user attributes update" do
		user = User.new(phone: "110", 
						password: "User@123")

		assert user.invalid?, user.errors.full_messages.inspect
		assert user.errors[:password_confirmation].any?, user.errors.full_messages.inspect
		assert user.errors[:phone].any?, user.errors.full_messages.inspect
		assert_equal ["has already been taken"], user.errors[:phone]
		assert_equal ["can't be blank"], user.errors[:password_confirmation]

		user.phone = "911"
		user.password_confirmation = "User@123"
		assert user.valid?
	end

  	test "user password confirm" do
		user = User.new(phone: "002", 
						password: "User@123",
						password_confirmation: "User@1234")

		assert user.invalid?, user.errors.full_messages.inspect
		assert user.errors[:password].any?, user.errors.full_messages.inspect
		assert_equal ["doesn't match confirmation"], user.errors[:password]

		user.password_confirmation = "User@123"
		assert user.valid?

		assert user.authenticate('User@123')
		assert !user.authenticate('User@1231')
	end

	test "add credit test" do
		user = users(:one)
		assert user.addCredit!(100)
		assert_equal 200, user.credit

		assert user.removeCredit!(100)
		assert_equal 100, user.credit

		assert !user.removeCredit!(200)
		assert_equal 100, user.credit
	end
end
