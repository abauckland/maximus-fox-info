require 'test_helper'

class ClauselineTest < ActiveSupport::TestCase
   test "should have associations" do
     clauseline = Clauseline.new
     assert_respond_to(clauseline, :clauselinevalues)
     assert_respond_to(clauseline, :linevalues)
     assert_respond_to(clauseline, :subclause)
     assert_respond_to(clauseline, :linetype)
     assert_respond_to(clauseline, :txt)
   end
end
