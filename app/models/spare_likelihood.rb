# -*- encoding : utf-8 -*-
class SpareLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :generic_spare

  # validates_presence_of :generic_spare, :message => 'Una pieza tiene que contener nombre y codigo'
  accepts_nested_attributes_for :generic_spare, reject_if: proc { |attributes| attributes[:name].blank? || attributes[:code].blank?}, allow_destroy: true


  def reject_blank_spare_relations
    self.generic_spare_id.blank?
  end
end
