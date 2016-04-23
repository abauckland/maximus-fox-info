require 'test_helper'

class ProductidentitiesTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     descript = Productidentity.new
     assert_respond_to(descript, :product)
     assert_respond_to(descript, :identity)
   end
end
