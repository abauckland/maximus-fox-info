require 'test_helper'

class PerformkeyTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     performkey = Performkey.new
     assert_respond_to(performkey, :performs)
   end

#scopes
   test "should return keys for items" do
      item = items(:one)
      keys = Performkey.item_performkey_ids(item.id)
      assert_equal [1,2], keys
   end

end
