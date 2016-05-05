
module Api
  module V1
    class ItemsController < ApplicationController
# curl http://localhost:3000/api/products -H 'Authorization: Token token="afbadb4ff8485c0adcba486b4ca90cc4"'
      include ActionController::HttpAuthentication::Token

#      before_filter :restrict_access
      before_action :set_item

#      before_action :set_ref_system
#params[:ref_system, :system, :query_array]

#data responses to single item id
      def show
        @ident_keys = Identkey.item_identkey(@item.id)
        @perform_keys = Performkey.item_performkey(@item.id)
      end

      def show_children
        @child_ids = Itemitem.where(:parent_id => @item.id).pluck(:child_id)
      end

      def show_parents
        @parent_ids = Itemitem.where(:child_id => @item.id).pluck(:parent_id)
      end

#used where list of possible items is returned based on search term
      def search
        @items = Item.title_search(params[:search_term])
        respond_with @items
      end

      def missing_items
        @items = Item.not.where(:id => params[:id_array])
      end#

    #get multiple items at same time
        #! return list of items, associated items, subclauses without duplication
        #1 return two items - return items, list of subclauses - without duplication, 
        #subclause content

#{
#"item_1":{
#  "code":"clause_ref",
#  "title":"clause_name",
#  "content":{
#    "key_1":"value_1",
#    "key_2":["one":"option_1", "two":"option_2"]
#             },
#  "subclauses":["id","id"],
#  "associated_items":["id","id"],
#  "guide":"guide_html_string"
# },
# "item_2":{},
#}


def check_query_protocol
       #if params[:protocol] == 'uniclass'
          #check format of query string
          
          #if not ok
            #send error message
          #else
            #split query_string
          #end
end

def check_caws_query_string(query_string)
  #if query_string.match()
   
  #else
   #send error message
  #end
end

def check_uniclass_query_string(query_string)
  #if query_string.match()
  
  #else
   #send error message
  #end
end

def check_key_word_query_string(query_string)
  #split string into array
   #key_word_array = query_string.split(",")
   #key_word_array.each do |key_word|
    #if key_word.match()
    
    #else
     #send error message
    #end
   #end 
#check each key_word exists in database
#if no error run query after checking all
end


def caws_query(query_string)
#find item clause
#set up query 
  #:section_ref => query_string[]
  #:subsection_ref => query_string[]
  #:clauseref => query_string[]
#find associated clauses for item clause
#get guides for each clause
end

def uniclass_query(query_string)

#system search
#product search

#find item
#set up query
  
  #table_ref => query_string[]
  #group_ref => query_string[]
  #section_ref => query_string[]
  #subsection_ref => query_string[]
  #object_ref => query_string[]
end

def key_word_query(query_string)
  #search each word in turn
  
  #return last valid list found
  #@results = {}
  #array_length = query_array.length
  
  #query_string.each_with_index do |key_word, i|
    #search item or reference system name by keyword
    
    #return list of possible values - ids of records

    #if search_results.blank?
       #if i == 0
        #return error message
       #else
        #@results = list_of_ids
       #end
    #else
     #if array_length == i
        #@results = list_of_ids 
     #end
    #end
  #end

  #return list of ids
  #user to select which item to pull clauses and guides for.
   
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        ApiKey.exists?(access_token: token)
      end
    end


#    def set_ref_system

      #params[:ref_system, :client]
      
      #check if params are correct
      
      #if not #return error

#      @client_name = api_account.client
#      @client_model = api_account.client.classify.constantize
#      @ref_system_name = api_account.ref_system
#      @ref_system_model = api_account.ref_system.classify.constantize            
#    end
end
end
end