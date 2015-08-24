# -*- encoding : utf-8 -*-
class Supplier < ActiveRecord::Base
	belongs_to :supplier_type
	has_many :stock_families
	has_many :order_suppliers

	has_many :orders, through: :order_suppliers
	has_many :supplies
	
	has_many :generic_families, through: :supplier_codes
	has_many :supplier_codes

	has_many :generic_spares, through: :spare_supplier_codes
	has_many :spare_supplier_codes


	validates :name, :supplier_type_id, presence: true

  def self.import(file)
  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	 (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      supplier_family_code = row[0].split("/")
  		supplier_code_tuple = {generic_family_id: supplier_family_code[0], supplier_id: supplier_family_code[1], price_centavos: row[4], code: row[3]} 
      supplier_code = SupplierCode.where(supplier_id: supplier_code_tuple[:supplier_id], generic_family_id:supplier_code_tuple[:generic_family_id]).first_or_initialize
      supplier_code.price = supplier_code_tuple[:price_centavos]
      supplier_code.code = supplier_code_tuple[:code]
      begin
        supplier_code.save!
      rescue Exception => error
        next
      end
    end
  end
  def import(file)
  	spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	 (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      puts row

		  # 		supplier_code_tuple = {generic_family_id: supplier_family_code[0], supplier_id: supplier_family_code[1], price_centavos: row[4], code: row[3]} 
    #   supplier_code = SupplierCode.where(supplier_id: supplier_code_tuple[:supplier_id], generic_family_id:supplier_code_tuple[:generic_family_id]).first_or_initialize
    #   supplier_code.price = supplier_code_tuple[:price_centavos]
    #   supplier_code.code = supplier_code_tuple[:code]
    #   begin
    #     supplier_code.save!
    #   rescue Exception => error
    #     next
    #   end
    # end
  end
  end


  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".xls" then Roo::Spreadsheet.open(file.path, extension: :xls)
    when ".xlsx" then Roo::Spreadsheet.open(file.path, extension: :xlsx)
    else 
      raise "Archivo Desconocido: #{file.original_filename}"
    end
  end
end
