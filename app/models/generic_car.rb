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
  validates :first_generation_year,inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"},presence: true
  validates :last_generation_year,inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"},presence: true

  before_save :generate_code
  before_save :generation_split

  # //Queries//
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("model like ? OR brand like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.gen_continues_search
    where("gen_continues == 1")
  end

  # //Functions//
  def generate_code
    @brand = Brand.find_by_id(brand_id)
    @model = model.split(//).first(2).join
    @edition = number_of_generation.split(//).first(1).join
    self.code = (@brand.acronym+@edition+@model).upcase()
  end
  
  def generation_split
    for i in first_generation_year.to_i...last_generation_year.to_i+1
      @record = Generation.find_by_year(i)
      @generation = GenericCarGeneration.new(generic_car_id:self.id, generation_id: @record.id)
      @generation.save
    end
  end

  private
  def generation_order
    if last_generation_year < first_generation_year
      errors.add(:last_generation_year, "Ultimo año de generación no puede ser menor al primer año de generación")
    end
  end

end
