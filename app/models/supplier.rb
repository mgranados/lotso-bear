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


  def import(file, generic_car)
  	spreadsheet = Supplier.open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	 (2..spreadsheet.last_row).each do |i|
        row = spreadsheet.row(i)

        if row[7].downcase == 'si' or row[7].downcase == "sí"
          restock = true
        else
          restock = false
        end
        row[0].split('/')[0] == 'F'? isFamily = true : isFamily = false

    		supplier_code_tuple = {id:row[0].split('/')[1],interior_code: row[2], exterior_code:row[4], years: row[3], price_centavos: row[5], minimum_qty: row[6], restock: restock, image_url: row[9]} 
        puts supplier_code_tuple

        if isFamily
          begin
            generic_family = GenericFamily.find_by_id(supplier_code_tuple[:id])
            generic_family.years = supplier_code_tuple[:years]
            generic_family.minimum_quantity = supplier_code_tuple[:minimum_qty]
            generic_family.restock = supplier_code_tuple[:restock]
            generic_family.save!
          rescue
            next
          end
          supplier_code = SupplierCode.where(supplier_id: self.id, generic_family_id:supplier_code_tuple[:id]).first_or_initialize
          supplier_code.price = supplier_code_tuple[:price_centavos]
          supplier_code.code = supplier_code_tuple[:exterior_code]
          supplier_code.generic_family_supplier_images.new.image_from_url(supplier_code_tuple[:image_url]) unless supplier_code_tuple[:image_url].blank? || supplier_code_tuple[:image_url].downcase == 'no' || supplier_code_tuple[:image_url].downcase == 'sí'
         

        else
          begin
            generic_spare = GenericSpare.find_by_id(supplier_code_tuple[:id])
            generic_spare.years = supplier_code_tuple[:years]
            generic_spare.minimum_quantity = supplier_code_tuple[:minimum_qty]
            generic_spare.restock = supplier_code_tuple[:restock]
            generic_spare.save!
          rescue
            next
          end
          supplier_code = SpareSupplierCode.where(supplier_id: self.id, generic_spare_id:supplier_code_tuple[:id]).first_or_initialize
          supplier_code.price = supplier_code_tuple[:price_centavos]
          supplier_code.code = supplier_code_tuple[:exterior_code]
        end
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
      raise "Archivo Desconocido: #{file.original_filename}"
    end
  end
end
