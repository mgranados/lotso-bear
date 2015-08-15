# -*- encoding : utf-8 -*-
class ModelAcronym < ActiveRecord::Base
  #Associations
  belongs_to :brand
  has_many :generic_cars

  #Validations
  validates :model, :initials, :brand_id, presence: true

  # validates_uniqueness_of :model, :scope => :brand_id
  validates :model, uniqueness: true
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
    def brand_with_initials_uniqueness
      if ModelAcronym.exists?(:brand_id => brand_id, model: model,:initials => initials)
      # if ModelAcronym.exists?(:brand_id => brand_id, model: model,:initials => initials)
        return false
      elsif ModelAcronym.exists?(:brand_id => brand_id,:initials => initials)
        errors.add(:initials, "Ya Existen")
      end
    end

end
