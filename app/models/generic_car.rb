class GenericCar < ActiveRecord::Base
  # //Associations//
  has_many :stock_cars
  has_many :generic_fittables

  belongs_to :car_type
  belongs_to :model_acronym

  accepts_nested_attributes_for :model_acronym
  accepts_nested_attributes_for :car_type

  has_many :generic_car_generations
  has_many :generations, through: :generic_car_generations

  has_many :generic_car_images, dependent: :destroy
  accepts_nested_attributes_for :generic_car_images

  belongs_to :car_type

  belongs_to :model_acronym, inverse_of: :generic_cars
  accepts_nested_attributes_for :model_acronym

  has_many :family_likelihoods
  has_many :generic_families, through: :family_likelihoods

  accepts_nested_attributes_for :family_likelihoods

  # //Validations//
  validates :years, :number_of_generation, :car_type, :model_acronym, presence: true
  # validates_associated :model_acronym
  #//Callbacks//
  before_save :generation_split

  def save_and_add_families
    self.transaction do
      self.save!
      self.add_families
    end
  end

  def add_families
    type_likelihoods = TypeLikelihood.where(car_type_id: self.car_type_id)
    type_likelihoods.each do |type_likelihood|
      self.generic_families << type_likelihood.generic_family.clone_generic_family_with_generic_spares
    end
  end

  # //Queries//
  def self.search(query)
    where("model like ? OR brand like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.gen_continues_search
    where(gen_continues: true)
  end

  # //Functions//
  def code
    "#{model_acronym.brand.acronym}-#{number_of_generation.split(//).first}-#{model_acronym.initials}"
  end

  def find_model
    existing_model = ModelAcronym.where(:brand_id => brand_id, model: model).first
    if existing_model.exist?
      self.model_acronym << existing_model
      return false
    end
  end

  def years_split
    if self.years.length == 4
      self.first_generation_year = self.years
      self.last_generation_year = Date.today.year
    else
      self.first_generation_year = self.years.split('-')[0]
      self.last_generation_year = years.split('-')[1]
    end
  end

  def formatted_year
    gen_continues ? "#{first_generation_year} - Año Actual" : "#{years}"
  end

  # def self.fix_generic_car_families
  #   all.each do |generic_car_m|
  #     puts "Generic Car - Model:#{generic_car_m.model_acronym.model} #Families: #{generic_car_m.car_type.generic_families.count}"
  #     generic_car_m.car_type.generic_families.each do |generic_family_m|
  #       puts "Generic Family: #{generic_family_m.name}"
  #       generic_car_m.car_type.generic_families << generic_family_m.clone_generic_family_with_generic_spares
  #     end
  #     puts "Generic Car - Model:#{generic_car_m.model_acronym.model} #Families: #{generic_car_m.car_type.generic_families.count}"
  #     puts "Next Record --------------------------------------------------------------"
  #   end
  #   @generic_families = GenericFamily.where(father_id: nil)
  #   @generic_families.each do |generic_family|
  #     generic_family.type_likelihoods.destroy_all
  #   end
  # end


  private

  def generation_split
    years_split
    for i in self.first_generation_year.to_i..self.last_generation_year.to_i
      @record = Generation.find_by_year(i)
      @generation = GenericCarGeneration.new(generic_car_id:self.id, generation_id: @record.id)
      @generation.save
    end
  end

  def generation_order
    if last_generation_year < first_generation_year
      errors.add(:last_generation_year, "Ultimo año de generación no puede ser menor al primer año de generación")
    end
  end

end
