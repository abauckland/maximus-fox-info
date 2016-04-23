require 'test_helper'

class PreambleTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     preamble = Preamble.new
     assert_respond_to(preamble, :guides)
   end
end