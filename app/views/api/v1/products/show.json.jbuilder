json.item do  

  json.products @products.id

  json.set! :identity do
    @ident_keys.each do |key|
      json.set! key.text, Identvalue.item_performvalues_array(@item.id, key.id)
    end
  end

  json.set! :performance do
    @perform_keys.each do |key|
      json.set! key.text, Performvalue.item_performvalues_array(@item.id, key.id)
    end
  end

  json.guide @item.guidance

end