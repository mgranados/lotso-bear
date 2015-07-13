# -*- encoding : utf-8 -*-
class Warehouse < ActiveRecord::Base
  has_many :stock_spares
  has_many :stock_cars
  has_many :orders
  has_many :shelves
   
  validates :branch, :location, :code, presence: true
  validates :code, uniqueness: true
  before_save :upcase

  private 
	def upcase
      self.code.upcase!
 	end

end
