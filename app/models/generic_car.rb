class GenericCar < ActiveRecord::Base
  has_many :cars
  has_many :car_spare_alloys
  has_many :generic_spares, through: :car_spare_alloys, dependent: :destroy

  accepts_nested_attributes_for :car_spare_alloys, :reject_if => proc { |a| a[:relation].blank? }

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("model like ? OR brand like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

end
