json.item do  
  json.id @item.id
  json.title @item.title

json.content do

    @ident_keys.each do |key|
      Identvalue.item_performvalues_array(@item.id, key.id)

      json.set! line do	
        json.text
        json.variables
  	  end

      json.set! key.text, Identvalue.item_performvalues_array(@item.id, key.id)
    end

    @perform_keys.each do |key|
      json.set! key.text, Performvalue.item_performvalues_array(@item.id, key.id)
    end

end

end