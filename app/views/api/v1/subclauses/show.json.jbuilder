json.subclause do
  json.id @subclause.id
  json.title @subclause.title
  json.descript1 @subclause.descript1
  json.descript2 @subclause.descript2
  json.clausetype @subclause.clausetype_title

  json.content do
    @lines.each_with_index do |line, i|
      clauselinevalues = Linevalue.joins(:clauselines).where('clauselines.id' => line.id).pluck(:text)
      json.set! (i+1) do
        json.linetype line.linetype_id
        json.level line.linetype.level
        json.text line.txt.text
        json.variables clauselinevalues
      end
    end
  end

  json.guide @subclause.guide_id

end