class GenericCar < ActiveRecord::Base
  has_many :cars
  has_many :car_spare_alloys
  has_many :generic_images, foreign_key: :generic_id
  has_many :generic_spares, through: :car_spare_alloys, dependent: :destroy
  has_many :generic_car_generations
  has_many :generations, through: :generic_car_generations, dependent: :destroy

  # attr_accessor :first_generation_year, :last_generation_year


  # accepts_nested_attributes_for :car_spare_alloys, :reject_if => proc { |a| a[:relation].blank? }
  accepts_nested_attributes_for :generic_images, :generic_car_generations

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("model like ? OR brand like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

end
