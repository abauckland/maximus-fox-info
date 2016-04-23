require 'test_helper'

class PostscriptTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     postscript = Postscript.new
     assert_respond_to(postscript, :guides)
   end
end
