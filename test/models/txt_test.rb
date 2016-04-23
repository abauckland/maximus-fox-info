require 'test_helper'

class TxtTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     txt = Txt.new
     assert_respond_to(txt, :clauselines)
   end
end