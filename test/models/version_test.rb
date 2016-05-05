require 'test_helper'

class VersionTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     version = Version.new
     assert_respond_to(version, :items)
   end
end