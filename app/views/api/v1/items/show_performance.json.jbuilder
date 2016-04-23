json.item do
  json.id @item.id
  json.title @item.title

  json.set! :performance do
    @perform_keys.each do |key|
      json.set! key.text, Performvalue.item_performvalues_array(@item.id, key.id)
    end
  end

end