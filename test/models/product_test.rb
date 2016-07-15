require 'test_helper'

class ProductTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     product = Product.new
     assert_respond_to(product, :items)
     assert_respond_to(product, :productkeywords)
     assert_respond_to(product, :item)
   end
end