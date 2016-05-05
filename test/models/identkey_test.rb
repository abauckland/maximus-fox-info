require 'test_helper'

class IdentkeyTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     identkey = Identkey.new
     assert_respond_to(identkey, :identities)
   end

#scopes
   test "should return keys for items" do
      item = items(:one)
      keys = Identkey.item_identkey(item.id)
      assert_equal [1,2], keys.ids
   end

end
