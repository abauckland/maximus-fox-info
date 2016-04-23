require 'test_helper'

class SubclauseTest < ActiveSupport::TestCase
#associations
   test "should have associations" do
     subclause = Subclause.new
     assert_respond_to(subclause, :guide)
     assert_respond_to(subclause, :items)
#     assert_respond_to(subclause, :child_subclauses)    
#     assert_respond_to(subclause, :parent_subclauses)
   end
   
   #validations
   test "should not save without title" do
      subclause = Subclause.create()
      assert_not subclause.valid?, 'Should not create subclause without title'
   end

   test "should not save if duplicate title" do
      subclause = Subclause.create(title: 'subclause title one', descript1: 'description one', descript2: 'description two') #existing record set in fixtures
      assert_not subclause.valid?
      assert_equal [": A clause with same similar attributes already exists"], subclause.errors.messages[:title]
   end

   test "should not save without clausetype" do
      subclause = Subclause.create(title: 'test subclause three')
      assert_not subclause.valid?, 'Should not create item without clausetype'
   end

#scopes

#methods
   test "should return title with first letter of each word capitalised" do
      subclause = subclauses(:one)
      assert_equal "Subclause Title One", subclause.title_titleized
   end

   test "should return clausetype capitalized" do
      subclause = subclauses(:one)
      assert_equal "Scope", subclause.clausetype_title
   end

   test "should return guidance text string" do
      subclause = subclauses(:one)
      assert_equal "<p>test guide one text</p>", subclause.guidance
   end

   test "should return guidance text with preamble and postscript string" do
      subclause = subclauses(:two)
      assert_equal "<p>preamble</p><p>test guide two text</p><p>postscript</p>", subclause.guidance
   end
   
end
