class GenericFamily < ActiveRecord::Base

  has_many :childs, class_name: 'GenericFamily', foreign_key: 'father_id'
  belongs_to :father, class_name: 'GenericFamily'


  has_many :spare_likelihoods
  has_many :generic_spares, through: :spare_likelihoods

  has_many :stock_families

  has_many :type_likelihoods
  has_many :car_types, through: :type_likelihoods

  has_many :family_likelihoods
  has_many :generic_cars, through: :family_likelihoods

  accepts_nested_attributes_for :spare_likelihoods

  validates :name, presence: :true
  validates :code, presence: :true

  def self.not_assigned_families
    where.not(:id  => TypeLikelihood.select(:generic_family_id) )
  end

  def clone_generic_family_with_generic_spares
    # puts "Cloning: #{self.name}"
    clone = self.dup
    self.generic_spares.each {|spare| clone.generic_spares << spare.dup}
    clone.father = self
    clone.save
    # puts "Cloned: #{clone.name}"
    clone
  end

  def self.assigned_families
    where(:id  => TypeLikelihood.select(:generic_family_id) )
  end

  def self.other_families(generic_car)
    if generic_car.generic_families.empty?
      all
    else
      where('id not in (?)', generic_car.generic_families.pluck(:id).concat(generic_car.generic_families.pluck(:father_id)).compact)

    end
  end

end
