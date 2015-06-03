# -*- encoding : utf-8 -*-
class StockFamily < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :price
  belongs_to :supplier
  belongs_to :order
  has_many :stock_family_images
  has_many :stock_spares

  belongs_to :subsection

  after_create :create_code

  def self.available
  	 where(status: nil)
  end

  def self.create_stocks_from_generics (generic_family_id, spares_info,car_id)
    generic_family = GenericFamily.find_by_id(generic_family_id)
    generic_family.generate_stock_family_with_stock_spares(spares_info,car_id)
  end
  
private
  def create_code
    car = GenericCar.find_by_id(self.car_order_id)
    current_number =  StockFamily.where(generic_family_id: self.generic_family_id).count
    self.update(code: "#{car.code}#{self.generic_family.code}#{current_number}")
  end

end
