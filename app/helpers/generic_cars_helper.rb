module GenericCarsHelper
  def convert_code(str)
  	unless str.blank?
	    code = Array.new(str.split('-'))
	    code[0] = Brand.find_by_id(code[0]).acronym
	    code[2] = ModelAcronym.find_by_id(code[2]).initials
	    code = code.join
	end
	code
  end
end
