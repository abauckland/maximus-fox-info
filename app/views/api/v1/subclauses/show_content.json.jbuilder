json.subclause do
  json.id @subclause.id
  json.title @subclause.title

  json.content do

    lines = Clauseline.where(:subclause_id => subclause_id).order(:clauseline)
    lines.each_with_index do |line, i|

      json.set! line do	

	    json.order i
        json.prefix
        json.text
        json.variables

  	  end
    end
  end

end