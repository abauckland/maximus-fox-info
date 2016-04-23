require 'test_helper'

class LinevalueTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     linevalue = Linevalue.new
     assert_respond_to(linevalue, :clauselinevalues)
     assert_respond_to(linevalue, :clauselines)
   end
end
