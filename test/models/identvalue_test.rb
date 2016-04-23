require 'test_helper'

class IdentvalueTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     identvalue = Identvalue.new
     assert_respond_to(identvalue, :identities)
   end

#scopes
   test "should return array of values" do
      item = items(:one)
      key = identkeys(:one)
      value_array = Identvalue.item_identvalues_array(item.id, key.id)
      assert_equal ["Special"], value_array
   end

end
