# -*- encoding : utf-8 -*-
class TypeLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :car_type

  validates :generic_family_id, uniqueness: {scope: :car_type_id}


  accepts_nested_attributes_for :generic_family


  def self.dedupe
  grouped = all.group_by{|type| [type.generic_family_id,type.car_type_id] }
    grouped.values.each do |duplicates|
      duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end


end
