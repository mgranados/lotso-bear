class SpareLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :generic_spare

  accepts_nested_attributes_for :generic_spare, reject_if: proc { |attributes| attributes[:name].blank? || attributes[:code].blank?}

  def reject_blank_spare_relations
    self.generic_spare_id.blank?
  end
end
