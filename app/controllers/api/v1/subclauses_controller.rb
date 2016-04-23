
module Api
  module V1
    class SubclausesController < ApplicationController
# curl http://localhost:3000/api/products -H 'Authorization: Token token="afbadb4ff8485c0adcba486b4ca90cc4"'
      include ActionController::HttpAuthentication::Token

      before_filter :restrict_access
      before_action :set_subclause

#data responses to single item id
      def show_raw
      end

      def show_interpreted
      end

      def show_guide
      end

  private
    def set_subclause
      @subclause = Subclause.find(params[:id])
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end

    end
  end
end