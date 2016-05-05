json.item do  
  json.id @item.id
  json.title @item.title

  json.children @item.child_ids
  json.parents @item.parent_ids
  json.subclauses @item.subclause_ids

  json.products @item.products.ids

  json.set! :identity do
    @ident_keys.each do |key|
      json.set! key.text, Identvalue.item_identvalues_array(@item.id, key.id)
    end
  end

  json.set! :performance do
    @perform_keys.each do |key|
      json.set! key.text, Performvalue.item_performvalues_array(@item.id, key.id)
    end
  end

  json.guide @item.guidance

end