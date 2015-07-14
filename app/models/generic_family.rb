# -*- encoding : utf-8 -*-
class GenericFamily < ActiveRecord::Base

  has_many :childs, class_name: 'GenericFamily', foreign_key: 'father_id'
  belongs_to :father, class_name: 'GenericFamily'
  has_many :suppliers, through: :supplier_likelihoods
  has_many :supplier_likelihoods

  has_many :spare_likelihoods
  has_many :generic_spares, through: :spare_likelihoods

  has_many :stock_families

  has_many :type_likelihoods
  has_many :car_types, through: :type_likelihoods

  has_many :family_likelihoods
  has_many :generic_cars, through: :family_likelihoods

  has_many :suppliers, through: :supplier_codes
  has_many :supplier_codes

  accepts_nested_attributes_for :spare_likelihoods

  validates :name, presence: :true
  validates :code, presence: :true



  def self.add_to_corresponding_cars (type_likelihood)
    @generic_cars = GenericCar.where(car_type_id:type_likelihood.car_type_id)
    @generic_cars.each do |generic_car|
      family = type_likelihood.generic_family
      clone = family.clone_generic_family_with_generic_spares
      unless clone.blank?
        generic_car.generic_families << clone
        puts "Clone Name: #{clone.name} ID: #{clone.id} "
        clone.car_types.each {|type| puts "Type:  id: #{type.id} name: #{type.full_name}"}
      end
    end
  end

  # def self.copy_families_to_generic_cars
  #   where(father_id: nil).order(:id).each do |family|
  #     # puts "ID:#{family.id} Name: #{family.name}"
  #     family.car_types.each do |type|
  #       # puts "\t ID: #{type.id} Name: #{type.full_name}"
  #       @genericCars = GenericCar.where(car_type_id: type.id).distinct.order(:id)
  #       @genericCars.find_each do |car|
  #         # puts "\t \tID:#{car.id} Name: #{car.model_acronym.model}"
  #         car.generic_families << family.clone_generic_family_with_generic_spares
  #       end
  #     end
  #   end
  # end

  # def self.copy_families_final_fantasy
  #   GenericCar.find_each do |car|
  #       car.car_type.generic_families.each do |family|
  #         family_clone = family.clone_generic_family_with_generic_spares
  #         family_clone.car_types.each {|type| puts "Type: #{type.id} Name: #{type.full_name}"}
  #       end
  #   end
  # end
    # where(father_id: nil).each do |family|
    #   puts "Family: #{family.name} Code: #{family.code} Father: #{family.father_id}"
    #   family.car_types.each do |type|
    #   @genericCars = GenericCar.where(car_type_id: type.id).distinct
    #     @genericCars.each do |car|
    #       car.generic_families << family.clone_generic_family_with_generic_spares
    #       puts "Car #{car.model_acronym.model} Years: #{car.years}"
    #     end
    #   end
    # end

  def self.not_assigned_families
    where.not(:id  => TypeLikelihood.select(:generic_family_id)).where(father_id: nil)
  end

  def clone_generic_family_with_generic_spares
    puts "Name: #{self.name} Code: #{self.code}"
    clone = self.dup
    self.generic_spares.each do | spare|
      puts "Original ID: @#{spare.id} Name: #{spare.name}"
      clone_spare = spare.dup
      puts "clone    ID: @#{clone_spare.id} Name: #{clone_spare.name}"
      clone_spare.father_id = spare.id
      clone.generic_spares << clone_spare
    end
    # cont = 0
    # self.car_types.each do | type |
    #   puts "Orginal: #{type} WAZA"
    #   clone.car_types << type
    #   puts "Clone: #{type}"
    #   puts "Ronda #{cont+=1}"
    # end

    clone.father = self
    clone
  end

  def self.assigned_families
    where(:id  => TypeLikelihood.select(:generic_family_id) ).where(father_id: nil)
  end

  def self.other_families(generic_car)
    if generic_car.generic_families.empty?
      all
    else
      where('id not in (?)', generic_car.generic_families.pluck(:id).concat(generic_car.generic_families.pluck(:father_id)).compact).where(father_id: nil)

      # .where(father_id: nil)
    end
  end

  def generate_stock_family_with_stock_spares (spares_info, car_id)
    stockFam = StockFamily.new
    stockFam.generic_family_id = self.id
    stockFam.car_order_id = car_id

    spares_info.each do |spare_tuple|
      unless spare_tuple[:id].blank?
        spare = StockSpare.new
        spare.generic_spare_id = spare_tuple[:id]
        spare.supplier_code = spare_tuple[:supplier_code]
        spare.status = "Almacen"
        stockFam.stock_spares << spare
      end
    end
    stockFam
  end

  def name_with_code
    "#{self.name},#{self.code}"
  end

  def get_supplier_code(supplier)
    supplier_code = SupplierCode.where(generic_family_id: self.id, supplier_id: supplier.id)
    unless supplier_code.blank?
      supplier_code.first.code
    end
  end

end
