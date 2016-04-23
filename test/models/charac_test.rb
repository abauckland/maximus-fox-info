require 'test_helper'

class CharacTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     charac = Charac.new
     assert_respond_to(charac, :instance)
     assert_respond_to(charac, :perform)
   end
end