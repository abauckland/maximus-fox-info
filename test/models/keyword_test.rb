require 'test_helper'

class ProductkeywordTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     productkeyword = Productkeyword.new
     assert_respond_to(productkeyword, :product)
     assert_respond_to(productkeyword, :keyword)
   end
end