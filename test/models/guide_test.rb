require 'test_helper'

class GuideTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     guide = Guide.new
     assert_respond_to(guide, :items)
     assert_respond_to(guide, :subclauses)
     assert_respond_to(guide, :preamble)
     assert_respond_to(guide, :postscript)
   end

#validations
   test "should not save without text" do
      guide = Guide.create()
      assert_not guide.valid?, 'Should not create guide without text'
   end

#scopes

#methods
   test "should return guidance text string" do
      guide = guides(:one)
      assert_equal "<p>test guide one text</p>", guide.content
   end

   test "should return guidance text with preamble and postscript string" do
      guide = guides(:two)
      assert_equal "<p>preamble</p><p>test guide two text</p><p>postscript</p>", guide.content
   end


end