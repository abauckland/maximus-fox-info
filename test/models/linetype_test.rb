require 'test_helper'

class LinetypeTest < ActiveSupport::TestCase
   test "should have associations" do
     linetype = Linetype.new
     assert_respond_to(linetype, :clauselines)
   end
end
