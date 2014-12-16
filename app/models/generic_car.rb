class GenericCar < ActiveRecord::Base
  nilify_blanks
  # Associations
  has_many :cars
  has_many :car_spare_alloys
  has_many :generic_images, foreign_key: :generic_id
  has_many :generic_spares, through: :car_spare_alloys, dependent: :destroy
  has_many :generic_car_generations
  has_many :generations, through: :generic_car_generations, dependent: :destroy
  # accepts_nested_attributes_for :car_spare_alloys, :reject_if => proc { |a| a[:relation].blank? }
  accepts_nested_attributes_for :generic_images, :generic_car_generations

  #Validations
  validates :model, presence: true
  validate :generation_order
  # validates :code, uniqueness: true
  validates :year, inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"}, presence: true
  validates :first_generation_year,inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"},presence: true
  validates :last_generation_year,inclusion: { in: 1900..(Date.today.year+50), message: "Invalido"},presence: true

  # Queries
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("model like ? OR brand like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  # before_validation { image.clear if @delete_image }
  #
  # def delete_image
  #   @delete_image ||= false
  # end
  #
  # def delete_image=(value)
  #   @delete_image  = !value.to_i.zero?
  # end


  private
  def generation_order
    if last_generation_year < first_generation_year
      errors.add(:last_generation_year, "Ultimo año de generación no puede ser menor al primer año de generación")
    end
  end

end
