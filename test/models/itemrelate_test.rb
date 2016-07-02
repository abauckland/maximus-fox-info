require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  setup do
    @itemrelate_1 = itemrelates(:one)
    @itemrelate_2 = itemtelates(:two)
  end

#associations
   test "should have associations" do
     item = Item.new

     assert_respond_to(item, :itemitems)
     assert_respond_to(item, :item)
   end

end
