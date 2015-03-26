class FamilyLikelihood < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :generic_car

  validates :generic_family_id, uniqueness: {scope: :generic_car_id}

  accepts_nested_attributes_for :generic_family


  def self.dedupe
  grouped = all.group_by{|family| [family.generic_family_id,family.generic_car_id] }
    grouped.values.each do |duplicates|
      duplicates.shift
      duplicates.each{|double| double.destroy}
    end
  end



end
