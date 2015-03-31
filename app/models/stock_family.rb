class StockFamily < ActiveRecord::Base
  belongs_to :generic_family
  belongs_to :price
  belongs_to :supplier
  belongs_to :order
  has_many :stock_family_images

  after_create :create_code

  def self.available
  	 where(status: nil)
  end
private

  def create_code
  	self.update(code: "#{self.generic_family.code}-#{self.supplier_id}-#{Time.now.strftime('%d%m%Y')}-#{self.id}")
  end

end
