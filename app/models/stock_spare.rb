# -*- encoding : utf-8 -*-
class StockSpare < ActiveRecord::Base
  belongs_to :car
  belongs_to :warehouse
  belongs_to :generic_spare
  belongs_to :stock_family
  belongs_to :order
  belongs_to :shelf
  belongs_to :stock_car

  monetize :entrance_price_centavos, :allow_nil => true
  monetize :departure_price_centavos, :allow_nil => true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  has_many :stock_spare_images
  has_many :spare_histories

  after_create :create_code

  def self.stock_spare_label_info(stock_spare_id)
    spare = StockSpare.find_by_id(stock_spare_id)
    barcode = Barby::Code128B.new(spare.code)
    blob = Barby::PngOutputter.new(barcode).to_png(height: 40)
    file = "app/assets/images/barcodes/spares/#{spare.id}.png"
    File.open(file, 'w'){|f| f.write blob }
    return {:png => file, :model => spare.generic_spare.generic_families.first.generic_cars.first.model_acronym.model,:name => spare.generic_spare.name.titleize, :code => spare.code, :entrance_date => spare.stock_family.order.entrance_date.strftime("%m/%Y")}
  end

  private
  def create_code
    car = GenericCar.find_by_id(self.stock_family.car_order_id)
    current_number =  StockSpare.where(generic_spare_id: self.generic_spare_id).count
    self.update(code: "#{car.code}#{self.generic_spare.code}#{current_number}")
  end

end
