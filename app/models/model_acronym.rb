class ModelAcronym < ActiveRecord::Base
  #Associations
  belongs_to :brand
  has_many :generic_cars

  #Validations
  validates :model, :initials, :brand_id, presence: true

  # validate :brand_with_model_uniqueness
  validate :brand_with_initials_uniqueness

  #CallBakcks
  before_save :upcase

  #Methods
  def self.return_model(brand_id,model)
    where(:brand_id => brand_id, model: model).first
  end

  def model_already_exists?
    ModelAcronym.exists?(:brand_id => brand_id, model: model)
  end

  private
    def upcase
      self.initials.upcase!
      self.model.upcase!
    end
    #Custom Validations
    def brand_with_model_uniqueness
       if ModelAcronym.exists?(:brand_id => brand_id, model: model)
         errors.add(:model, "ya Existe")
       end
    end

    def brand_with_initials_uniqueness
       if ModelAcronym.exists?(:brand_id => brand_id, :initials => initials)
         errors.add(:initials, "Ya Existen")
       end
    end

end
