require 'barby'
require 'barby/barcode/code_128'
require 'barby/outputter/html_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'
require "prawn/measurement_extensions"
require 'barby/outputter/png_outputter'

class StockFamily < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :price
  belongs_to :supplier
  belongs_to :order
  belongs_to :stock_car
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  has_many :stock_family_images
  has_many :stock_spares
  has_many :family_histories


  belongs_to :subsection

  after_create :create_code

  def self.available
  	 where(status: nil)
  end

  def self.create_stocks_from_generics (generic_family_id, spares_info,car_id)
    generic_family = GenericFamily.find_by_id(generic_family_id)
    generic_family.generate_stock_family_with_stock_spares(spares_info,car_id)
  end

  def self.stock_family_label_info(stock_family_id)
    stock_family = self.find_by_id(stock_family_id)
    barcode = Barby::Code128B.new(stock_family.code) 
    blob = Barby::PngOutputter.new(barcode).to_png(height: 40) 
    file = "app/assets/images/barcodes/families/#{stock_family.id}.png"
    File.open(file, 'w'){|f| f.write blob }
    return {:png => file, :model => stock_family.generic_family.generic_cars.first.model_acronym.model, :name => stock_family.generic_family.name.upcase, :code => stock_family.code, :entrance_date => stock_family.order.entrance_date.strftime("%m/%Y")}
  end
  
private
  def create_code
    car = GenericCar.find_by_id(self.car_order_id)
    current_number =  StockFamily.where(generic_family_id: self.generic_family_id).count
    self.update(code: "#{car.code}#{self.generic_family.code}#{current_number}")
  end

end
