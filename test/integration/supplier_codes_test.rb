require 'test_helper'

class SupplierCodesTest < ActionDispatch::IntegrationTest
	def setup
	end

	test "should load all views correctly" do
		generic_car = generic_cars(:corolla)
		# Goes to suppliers
		visit suppliers_path

		# Chooses a supplier
    	first(:link, "Asignar Piezas").click
		# Chooses a car
		fill_in 'Buscar Vehículo',	with: generic_car.model_acronym.model
		# Downloads template
		click_link "Descargar Template"
		# Uploads template
		click_link "Subir Template"
	end
end
