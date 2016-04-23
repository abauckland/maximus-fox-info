
module Api
  module V1
    class ItemsController < ApplicationController
# curl http://localhost:3000/api/products -H 'Authorization: Token token="afbadb4ff8485c0adcba486b4ca90cc4"'
      include ActionController::HttpAuthentication::Token
#      include RefsystemSettings

      before_filter :restrict_access
      before_action :set_item

#      before_action :set_ref_system
#params[:ref_system, :system, :query_array]

#data responses to single item id
      def show
      end

      def show_children
      end

      def show_parents
      end

      def show_subclauses
      end

      def show_products
      end

      def show_identity
        @ident_keys = Identkey.item_identkey_ids(@item.id)
      end

      def show_preformance
        @perform_keys = Performkey.item_performkey_ids(@item.id)
      end

      def show_guide
      end



      def find_titles
        @items = Item.title_search(params[:search_term])
        respond_with @items
      end



#get reference system (specright, uniclass2015, other)
  #set table name
  #set type of reference code (caws, uniclass2015)
#get reference code
  #look up code to get reference system id

#params[:client] - set in api key?
#params[:ref_system] - set in api key?

#params[:variables]


#joins().where().order()


#return
###list of items

    #reference known - id of item
      #get items for single reference
        #! get item using id or title
        #! Item.where(:id => params[:id]).first
      #get multiple items
        #! Item.where(:id => params[:ids])


    #references not known
      #find items with no reference
        #! get list of all item ids
        #! Item.all.ids
        #! compare in user system and then get details of each one that has no match
        #! user call first item id
        #! assign reference in host system

    #items by key word
        #! search item list by search terms
        #! Item.title_search(params[:search]) 

    #list all items
        #! get list of all ids 
        #! Item.all.ids

    #get multiple items at same time
        #! return list of items, associated items, subclauses without duplication
        #1 return two items - return items, list of subclauses - without duplication, 
        #subclause content




#FRESH PULL OF DATA - NO EXISTING SET UP

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





###get all items
    #get all items
    #items = Item.all.order_by_parent().order_by_ref_system()
    

    #for each item get contents
    #item = {}
      #items.each_with_index do |item|
        #assemble contents for item clause
        #get each line for item
          #get descriptor lines
            #from all products associated with item
            ##variables = Performkey.joins(:performs => characs .... ).where().uniq.order_by_frequency
            ## get variables
          #get general lines
            #from all products associated with item
            #get variables
          #get performance lines
            #from all products associated with item
            #get variables          
            ##variables = Identitykey.joins(:identities =>  .... ).where().uniq.order_by_frequency
        #associate with item
        #item[:content] = content
        
        #assemble guide for item clause
          #item[:guide] = item.guidance
        #associate with item
      #end
    #for each item get contents and guides

    #return items and subclauses




    #return list of items ordered by reference code
    #return item and associated items order by reference code
    #

    #get item by title name
      #return list of closest matches
    #get item by ref_system code
      #return list of closest matches - should be just one match


###get all item and associated content

###get all item and associated content    
    
###get all items and return list of references for selected system
    #Item.all
###get all items and return list of where no references for system






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