require 'test_helper'

class TypeTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     type = Type.new
     assert_respond_to(type, :products)
   end
end