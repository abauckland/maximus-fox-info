require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  setup do
    @item_1 = items(:one)
    @item_2 = items(:two)
  end

#associations
   test "should have associations" do
     item = Item.new
     assert_respond_to(item, :version)
     assert_respond_to(item, :guide)
     assert_respond_to(item, :products)
     assert_respond_to(item, :subclauses)
     assert_respond_to(item, :child_items)
     assert_respond_to(item, :parent_items)
   end

#validations
   test "should not save without title" do
      item = Item.create()
      assert_not item.valid?, 'Should not create item without title'
   end

   test "should not save if duplicate title" do
      item = Item.create(title: 'test item one') #existing record set in fixtures
      assert_not item.valid?
      assert_equal [": An item with the same title already exists"], item.errors.messages[:title]
   end

#scopes
   test "should return title which contains search word" do
      item = Item.title_search("one").first #existing record set in fixtures with title 'test item one'
      assert_equal 'test item one', item.title
   end

#methods
   test "should return title with first letter of each word capitalised" do
      assert_equal "Test Item One", @item_1.title_titleized
   end

   test "should return ids of children" do
      assert_equal [4, 2], @item_1.child_ids
   end

   test "should return ids of parents" do
      assert_equal [1], @item_2.parent_ids
   end

   test "should return ids of subclauses" do
      assert_equal [1,2], @item_1.subclause_ids
   end

   test "should return ids of prodcuts" do
      assert_equal [1,2], @item_1.product_ids
   end

   test "should return guidance text string" do
      assert_equal "<p>test guide one text</p>", @item_1.guidance
   end

   test "should return guidance text with preamble and postscript string" do
      item = items(:two)
      assert_equal "<p>preamble</p><p>test guide two text</p><p>postscript</p>", item.guidance
   end

end
