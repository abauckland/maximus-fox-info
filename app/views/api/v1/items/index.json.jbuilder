json.item do  
  json.id @item.id
  json.title @item.title
  json.products @item.products.ids
end