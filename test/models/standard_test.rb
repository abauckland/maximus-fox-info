require 'test_helper'

class StandardTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     standard = Standard.new
     assert_respond_to(standard, :performkeys)
   end
end