
module Api
  module V1
    class ProductsController < ApplicationController
# curl http://localhost:3000/api/products -H 'Authorization: Token token="afbadb4ff8485c0adcba486b4ca90cc4"'
      include ActionController::HttpAuthentication::Token

#      before_filter :restrict_access

def show

end

  def find_keys
  #{item_id: id, selected_key:text, content: [{key_text:value_text}, {key_text:value_text}]
#TODO differentiate between identity and performance keys?
    item_id = params[:item_id]
    contents = params[:content]

    current_key_array = []
    perform_pair_ids = []

    contents.each do |line|
      perform_pair_ids << Perform.where('performkeys.text' => line.keys.first, 'performvalues.text' => line.values.first).first.id
      current_key_array << line.keys.first
    end
    instance_ids = Instance.joins().where(:item_id => item_id, 'characs.perform_id' => perform_pair_ids).ids.uniq

    @possible_keys = Performkey.joins().where('instances.id' => instance_ids).not.where(:text => current_key_array).pluck(:text).uniq
  end


  def find_values
#{item_id: id, selected_key:text, content: [{line_1: {key:text, value:text},{line_1: {key:text, value:text}]}
#TODO differentiate between identity and performance values?
    item_id = params[:item_id]
    contents = params[:content] #array of lines with key and value text
    key_text = params[:selected_key]

#TODO filter out where value is blank/neutral
    perform_pair_ids = []
    contents.each do |line|
      perform_pair_ids << Perform.where('performkeys.text' => line.keys.first, 'performvalues.text' => line.values.first).first.id
    end
    instance_ids = Instance.joins().where(:item_id => item_id, 'characs.perform_id' => perform_pair_ids).ids.uniq

    @possible_values = Performvalue.joins.().where('instances.id' => @instance_ids, 'performkeys.text' => selected_key).pluck(:text)
    #if not available - state, return to be selected

#TODO does this only give options for products with all selected perform pairs
#TODO does this give options for possible vairants

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