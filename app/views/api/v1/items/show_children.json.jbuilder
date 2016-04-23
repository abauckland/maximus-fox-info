json.item do  
  json.id @item.id
  json.title @item.title
  json.children @item.child_ids
end