json.item do  
  json.id @item.id
  json.title @item.title
  json.parents @item.parent_ids
end