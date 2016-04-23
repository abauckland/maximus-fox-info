require 'test_helper'

class PerformvalueTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     performvalue = Performvalue.new
     assert_respond_to(performvalue, :performs)
#     assert_respond_to(performvalue, :performtxt)
#     assert_respond_to(performvalue, :valuetype)
   end

#scopes
   test "should return array of values" do
      item = items(:one)
      key = performkeys(:one)
      value_array = Performvalue.item_performvalues_array(item.id, key.id)
      assert_equal ["Green","Blue"], value_array
   end


#method
#   test "should return perform text" do
#      performvalue = performvalues(:one)
#      assert_equal "Blue", performvalue.perform_text
#   end

#   test "should return value with units and standard" do
#      performvalue = performvalues(:two)
#      assert_equal "200mm to BS8000", performvalue.value_with_units
#   end

#   test "should return value with standard" do
#      performvalue = performvalues(:three)
#      assert_equal "200 to BS8000", performvalue.value_with_units
#   end

#   test "should return value with units" do
#      performvalue = performvalues(:four)
#      assert_equal "200cm", performvalue.value_with_units
#   end

end
