require 'test_helper'

class RangeTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     range = Range.new
     assert_respond_to(range, :products)
   end
end