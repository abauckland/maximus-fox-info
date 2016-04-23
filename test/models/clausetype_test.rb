require 'test_helper'

class ClausetypeTest < ActiveSupport::TestCase
   test "should have associations" do
     clausetype = Clausetype.new
     assert_respond_to(clausetype, :subclauses)
   end
end
