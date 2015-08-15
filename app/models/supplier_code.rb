require 'roo'
class SupplierCode < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :supplier

# Que solo pueda haber una familia con un unico precio dentro de cada proveedor
  validates_uniqueness_of :generic_family_id, :scope => :supplier_id

  validates :code, uniqueness: true

  monetize :price_centavos, :allow_nil => true

  def self.import(file)
  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	 (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      puts "codigo #{row[0]}"
      supplier_family_code = row[0].split("/")
      puts supplier_family_code
  		supplier_code_tuple = {generic_family_id: supplier_family_code[0], supplier_id: supplier_family_code[1], price_centavos: row[4], code: row[3]} 
      puts supplier_code_tuple
      supplier_code = where(supplier_id: supplier_code_tuple[:supplier_id], generic_family_id:supplier_code_tuple[:generic_family_id]).first_or_initialize
      supplier_code.price = supplier_code_tuple[:price_centavos]
      supplier_code.code = supplier_code_tuple[:code]
      begin
        supplier_code.save!
      rescue Exception => error
        next
      end
    end
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
    when ".xlsx" then Roo::Spreadsheet.open(file.path, extension: :xlsx)
    else 
      raise "Unknown file type: #{file.original_filename}"
    end
  end

end
