class GenericCar < ActiveRecord::Base
  # //Associations//
  has_many :cars
  has_many :car_spare_alloys

  has_many :generic_images, foreign_key: :generic_id

  has_many :generic_spares, through: :car_spare_alloys, dependent: :destroy
  has_many :generic_car_generations

  has_many :generations, through: :generic_car_generations, dependent: :destroy
  belongs_to :brand

  # accepts_nested_attributes_for :car_spare_alloys, :reject_if => proc { |a| a[:relation].blank? }
  accepts_nested_attributes_for :generic_images, :generic_car_generations

  # //Validations//
  validates :brand_id, presence: true
  validates :model, presence: true
  # validates :code, uniqueness: true
  validates :year, inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"}, presence: true
  # validates :first_generation_year,inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"},presence: true
  # validates :last_generation_year,inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"},presence: true

  before_save :generate_code
  before_save :generation_split
  before_save :upcase

  attr_accessor :years

  def upcase
    self.model.upcase!
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

  # //Queries//
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("model like ? OR brand like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.gen_continues_search
    where(gen_continues: true)
  end

  # //Functions//
  private

  def generate_code
    self.code = ("#{self.brand_id}-#{self.number_of_generation.split(//).first(1).join}-#{generate_model_code}")
  end

  def model_initials(model,originalModel,iteration,emer)
    if emer < 9
      modelInitials = "#{model.split(//)[0]}#{model.split(//)[iteration]}"
    else
      modelInitials = "#{('A'...'Z').to_a[rand(0...27)]}#{rand(0...10)}"
    end
    if ModelAcronym.where(brand_id:self.brand_id).where(initials: modelInitials).blank?
      newAcronym = ModelAcronym.create(brand_id:self.brand_id,initials:modelInitials, model:originalModel)
      newAcronym.save
      return newAcronym.id
    else
        if iteration < model.length-1
          return model_initials(model,originalModel,iteration+1,emer)
        else
          return model_initials("#{model}#{emer}",originalModel,iteration,emer+1)
        end
    end
  end

  def generate_model_code
    return model_exist  unless model_exist.blank?
    initials = self.model.split(//).first(2).join
    if ModelAcronym.where(brand_id: self.brand_id).where(initials: initials).blank?
      newAcronym = ModelAcronym.create(brand_id: self.brand_id, model: self.model, initials:initials)
      newAcronym.save
      return newAcronym.id
    else
      model_initials(self.model,self.model,1,0)
    end
  end

  def model_exist
    @modelCode = ModelAcronym.where(brand_id: self.brand_id).where(model: self.model).first
    @modelCode.try(:initials)
  end

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
