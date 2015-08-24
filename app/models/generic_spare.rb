# -*- encoding : utf-8 -*-
class GenericSpare < ActiveRecord::Base

  has_many :childs, class_name: 'GenericSpare', foreign_key: 'father_id'
  belongs_to :father, class_name: 'GenericSpare'


  has_many :generic_fittables
  has_many :generic_cars, through: :generic_fittables

  has_many :spare_likelihoods, dependent: :destroy
  has_many :generic_families, through: :spare_likelihoods

  has_many :stock_spares

	has_many :suppliers, through: :spare_supplier_codes
	has_many :spare_supplier_codes

  has_many :generic_spare_images

  validates :name, :code, presence: true
  # validates_uniqueness_of :code, :scope => :generic_cars

  # validate :unique_code_inside_single_generic_car

  # def unique_code_inside_single_generic_car
  #   if GenericSpare.joins(:generic_cars).where(code: self.code, generic_cars: {})
  # end


end
