class ModelAcronym < ActiveRecord::Base
  belongs_to :brand
  before_save :upcase

  def upcase
    self.initials.upcase!
    self.model.upcase!
  end
end
