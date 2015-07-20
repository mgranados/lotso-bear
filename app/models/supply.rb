class Supply < ActiveRecord::Base
	belongs_to :supplier
	has_many :spendings

	validates :name, :minimum_qty, :cost, :description, :quantity,  :code, presence: true
  	validates :code, uniqueness: true

end
