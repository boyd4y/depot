require 'test_helper'

class FactoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	test "factory attributes update" do
		factory = Factory.new(name: "fac_test_01", 
						description: "fac_test_01",
						code: "fac_test_01",
						email: 'a@gmail.com'
						)
		assert factory.valid?
	end

end
