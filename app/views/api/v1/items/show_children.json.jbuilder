json.item do  
  json.id @item.id
  json.title @item.title
  json.children @child_ids
end