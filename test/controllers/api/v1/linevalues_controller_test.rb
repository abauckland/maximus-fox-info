require 'test_helper'

class Api::V1::LinevaluesControllerTest < ActionController::TestCase

  setup do
    @linetype_id = 1
    @item_id = 1
    @clausetitle = "subclause title one"
    @text = "clause text one"
  end

#show
#curl -X GET http://localhost:3000/api/v1/guides/1.json
# curl -X GET http://localhost:3000/api/v1/guides/1.json -H 'Authorization: Token token="16e1955dcf6a6ec021f6d4147ecff821"

  test "should get guide record" do
    xhr :get, :show, format: :json, id: @item_id, clausetitle: @clausetitle, text: @text, linetype_id: @linetype_id
    assert_response :success

    json_response = JSON.parse(@response.body)
    assert_equal ["value_1", "value_2"], json_response["values"]
  end

end
