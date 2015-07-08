class Spending < ActiveRecord::Base
	belongs_to :user
	belongs_to :supply


	def self.create_with_cost (user,supply, quantity)
		spending = Spending.new(cost_cents:(supply.cost*quantity.to_i),quantity:quantity)
		spending.user = user
		spending.supply = supply
		spending.save!
	end
end
