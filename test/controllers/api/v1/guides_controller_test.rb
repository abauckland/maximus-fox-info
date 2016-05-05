require 'test_helper'

class Api::V1::GuidesControllerTest < ActionController::TestCase

  setup do
    @guide_1 = guides(:one)
    @guide_2 = guides(:two)
  end

#show
#curl -X GET http://localhost:3000/api/v1/guides/1.json
# curl -X GET http://localhost:3000/api/v1/guides/1.json -H 'Authorization: Token token="16e1955dcf6a6ec021f6d4147ecff821"

  test "should get guide record" do
    xhr :get, :show, format: :json, id: @guide_1.id
    assert_response :success

    json_response = JSON.parse(@response.body)
    assert_equal  "<p>test guide one text</p>", json_response["guide"]
  end

end
