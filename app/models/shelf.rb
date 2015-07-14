class Shelf < ActiveRecord::Base
	belongs_to :warehouse
  has_many :stock_families
  has_many :stock_spares

  validates :aisle, :row, :level, presence: true
  validates :aisle, length: { maximum: 2 }
  validates :row, length: { maximum: 2 }
  validates :level, length: { maximum: 2 }
  validates :number, length: { maximum: 2 }
	validates_uniqueness_of :aisle, :scope => [:row, :level, :number, :warehouse_id]
	before_save :upcase
  after_create :create_code


  private
  def create_code
    	self.update(code: "#{self.aisle}#{self.row}#{self.level}#{self.number}")
 	end

 	def upcase
      self.aisle.upcase!
  end


end
