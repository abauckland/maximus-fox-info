json.item do  
  json.id @item.id
  json.title @item.title
  json.guide format_content(@item.guidance)
end