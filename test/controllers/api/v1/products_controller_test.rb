require 'test_helper'

class Api::V1::ProductsControllerTest < ActionController::TestCase

  setup do
    @product_1 = products(:one)
    @product_2 = products(:two)
    @pair_array = [{"1"=>{"key"=>"text", "value"=>"text"}},{"2"=>{"key"=>"text", "value"=>"text"}}]
  end

#show
#curl -X GET http://localhost:3000/api/v1/products/1.json
# curl -X GET http://localhost:3000/api/v1/products/1.json -H 'Authorization: Token token="16e1955dcf6a6ec021f6d4147ecff821"

  test "should get product record" do
    xhr :get, :show, format: :json, id: @product_1.id
    assert_response :success

    json_response = JSON.parse(@response.body)
    assert_equal  "<p>test product one text</p>", json_response["product"]
  end

  test "should get a list of possible keys" do
    xhr :get, :find_keys, format: :json, item_id: @item.id, selected_key: "text", content: @pair_array
    assert_response :success

    json_response = JSON.parse(@response.body)
    assert_equal  "<p>test product one text</p>", json_response["product"]
  end

end
