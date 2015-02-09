class Prevaluation < ActiveRecord::Base
  has_many :stock_cars
  has_many :insureds

  has_one :valuation
  accepts_nested_attributes_for :stock_cars, :insureds

  has_many :prevaluation_images
end
