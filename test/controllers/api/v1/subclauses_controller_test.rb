require 'test_helper'

class Api::V1::SubclausesControllerTest < ActionController::TestCase

  setup do
    @subclause_1 = subclauses(:one)
    @subclause_2 = subclauses(:two)
  end

#show
#curl -X GET http://localhost:3000/api/v1/subclauses/1.json
# curl -X GET http://localhost:3000/api/v1/subclauses/1.json -H 'Authorization: Token token="16e1955dcf6a6ec021f6d4147ecff821"

  test "should get subclause record" do
    xhr :get, :show, format: :json, id: @subclause_1.id
    assert_response :success

    json_response = JSON.parse(@response.body)

    assert_equal  1, json_response["subclause"]["id"]
    assert_equal  "subclause title one", json_response["subclause"]["title"]
    assert_equal  "Scope", json_response["subclause"]["clausetype"]

    assert_equal  1,               json_response["subclause"]["content"]["1"]["linetype"]
    assert_equal  1,               json_response["subclause"]["content"]["1"]["level"]
    assert_equal  "clause text one", json_response["subclause"]["content"]["1"]["text"]
    assert_equal  ["value_1", "value_2"], json_response["subclause"]["content"]["1"]["variables"]

    assert_equal  1, json_response["subclause"]["guide"]
  end

end
