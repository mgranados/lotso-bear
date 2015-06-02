# -*- encoding : utf-8 -*-
class MoldSpare < ActiveRecord::Base
  has_many :generic_spares
  has_many :mold_components, dependent: :destroy

  accepts_nested_attributes_for :mold_components, :reject_if => proc {|attributes| attributes['name'].blank?}
end
