json.item do
  json.id @item.id
  json.title @item.title

  json.set! :identity do
    @ident_keys.each do |key|
      json.set! key.text, Identvalue.item_performvalues_array(@item.id, key.id)
    end
  end

end