module GenericCarsHelper
  def convert_code(str)
  	if str
	    code = Array.new(str.split('-'))
	    code[0] = Brand.find_by_id(code[0]).acronym
	    code[2] = ModelAcronym.find_by_id(code[2]).initials
	    code = code.join
	else
	code
	end
  end
end
