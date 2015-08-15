require 'test_helper'

class SupplierCodesTest < ActionDispatch::IntegrationTest
	def setup
  		Capybara.current_driver = :webkit
	end

	test "should load all views correctly" do
		generic_car = generic_cars(:corolla)
		# Goes to suppliers
		visit suppliers_path

		# Chooses a supplier
    	first(:link, "Asignar Piezas").click
		# Chooses a car
		fill_in 'model',	with: generic_car.model_acronym.model
		click_button "Buscar"

		visit search_by_model_in_supplier_generic_cars_path(generic_car)

      assert has_content?('CODIGOS Y PRECIOS'), "No llega a la pagina"
		# Download Template
		# Uploads template
		click_link "Subir Template"
	end
end
