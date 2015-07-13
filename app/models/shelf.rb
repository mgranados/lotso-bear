class Shelf < ActiveRecord::Base
	belongs_to :warehouse
  has_many :stock_families
  has_many :stock_spares

  validates :aisle, :row, :level, :number, presence: true
  validates :aisle, length: { is: 1 }
  validates :row, length: { is: 2 }
  validates :level, length: { is: 1 }
  validates :number, length: { is: 2 }
	validates_uniqueness_of :aisle, :scope => [:row, :level, :number]
	before_save :upcase
  after_create :create_code


  private
  def create_code
    	self.update(code: "#{self.aisle}#{self.row}#{self.level}#{self.number}")
 	end

 	def upcase
      self.aisle.upcase!
      self.row.upcase!
  end


end
