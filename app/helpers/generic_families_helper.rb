module GenericFamiliesHelper

	def build_spares_for_families(family, number)
		number.times {family.generic_spares.build}
	end
end
