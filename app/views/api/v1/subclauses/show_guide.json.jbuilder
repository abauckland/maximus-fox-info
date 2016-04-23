json.subclause do
  json.id @subclause.id
  json.title @subclause.title
  json.guide format_content(@item.guidance)
end