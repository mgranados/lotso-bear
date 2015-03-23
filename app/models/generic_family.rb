class GenericFamily < ActiveRecord::Base

  has_many :childs, class_name: 'GenericFamily', foreign_key: 'father_id'
  belongs_to :father, class_name: 'GenericFamily'


  has_many :spare_likelihoods
  has_many :generic_spares, through: :spare_likelihoods

  has_many :stock_families

  has_many :type_likelihoods
  has_many :car_types, through: :type_likelihoods

  has_many :family_likelihoods
  # , :uniq => true
  has_many :generic_cars, through: :family_likelihoods

  accepts_nested_attributes_for :spare_likelihoods

  validates :name, presence: :true
  validates :code, presence: :true

  def self.add_to_corresponding_cars (type_likelihood)
    @generic_cars = GenericCar.where(car_type_id:type_likelihood.car_type_id)
    @generic_cars.each do |generic_car|
      family = type_likelihood.generic_family
      generic_car.generic_families << family.clone_generic_family_with_generic_spares
    end
  end

  def self.copy_families_to_generic_cars
    where(father_id: nil).each do |family|
      puts "Family: #{family.name} Code: #{family.code} Father: #{family.father_id}"
      family.car_types.each do |type|
      @genericCars = GenericCar.where(car_type_id: type.id)
        @genericCars.each do |car|
          car.generic_families << family.clone_generic_family_with_generic_spares
          puts "Car #{car.model_acronym.model} Years: #{car.years}"
        end
      end
    end

  end

  def self.not_assigned_families
    where.not(:id  => TypeLikelihood.select(:generic_family_id)).where(father_id: nil)
  end

  def clone_generic_family_with_generic_spares
    # puts "Cloning: #{self.name}"
    clone = self.dup
    self.generic_spares.each do |spare|
      @spare = spare.dup
      @spare.father_id = spare.id
      clone.generic_spares << @spare
    end
    self.car_types.each do | type |
      clone.car_types << type
    end
    clone.father = self
    # clone.save
    # puts "Cloned: #{clone.name}"
    clone
  end

  def self.assigned_families
    where(:id  => TypeLikelihood.select(:generic_family_id) )
  end

  def self.other_families(generic_car)
    if generic_car.generic_families.empty?
      all
    else
      where('id not in (?)', generic_car.generic_families.pluck(:id).concat(generic_car.generic_families.pluck(:father_id)).compact).where(father_id: nil)

      # .where(father_id: nil)
    end
  end

end
