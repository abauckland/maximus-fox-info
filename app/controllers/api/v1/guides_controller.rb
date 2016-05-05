
module Api
  module V1
    class GuidesController < ApplicationController
# curl http://localhost:3000/api/products -H 'Authorization: Token token="afbadb4ff8485c0adcba486b4ca90cc4"'
#      include ActionController::HttpAuthentication::Token

#      before_filter :restrict_access

      def show
        @guide = Guide.find(params[:id])
      end

  private
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end

    end
  end
end