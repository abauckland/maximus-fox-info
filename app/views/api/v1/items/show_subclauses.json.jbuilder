json.item do  
  json.id @item.id
  json.title @item.title
  json.subclauses @item.subclause_ids
end