require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "variant not empty" do
		variant = variants(:one)
		assert variant.valid?
	end

	test "variant not empty after new" do
		variant = Variant.new( fullcode: 'XXXX01', password: '11234')
		assert variant.valid?
	end

	test "variant verify" do
		# FAC1PRD1XXXXXXXXXX1 111
		variant = variants(:one)
		assert variant.valid?
		assert !variant.verify!(users(:two), '1')
		assert !variant.verify!(users(:one), '1')
		assert !variant.verify!(users(:one), '1')
		assert !variant.verify!(users(:one), '2')
		assert !variant.verify!(users(:three), '2')
		assert variant.verify!(users(:one), '111')		
		assert_equal true, variant.checked
		assert variant.verify!(users(:one), '111')
		assert !variant.verify!(users(:two), '111')
		assert !variant.verify!(users(:three), '111')
	end
end
