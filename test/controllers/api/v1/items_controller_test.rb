require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  setup do
    @item_1 = items(:one)
    @item_2 = items(:two)
  end

#show
#curl -X GET http://localhost:3000/api/v1/bims/1.json
  test "should get item record" do
    xhr :get, :show, format: :json, id: @item_1.id
    assert_response :success

    json_response = JSON.parse(@response.body)

    assert_equal  "test item one", json_response["item"]["title"]
    assert_equal  "<p>test guide one text</p>", json_response["item"]["guide"]
  end

  test "should get list of children ids" do
    xhr :get, :show_children, format: :json, id: @item_1.id
    assert_response :success

    json_response = JSON.parse(@response.body)
    assert_equal  [2,4], json_response["item"]["children"]
  end

  test "should get list of parent ids" do
    xhr :get, :show_parents, format: :json, id: @item_2.id
    assert_response :success

    json_response = JSON.parse(@response.body)
    assert_equal  [1], json_response["item"]["parents"]
  end


#  test "should get index" do
#    get :index
#    assert_response :success
#    assert_not_nil assigns(:termcats)
#  end

end
