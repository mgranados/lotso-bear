require 'test_helper'

class GenericCarUsageTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.current_driver = :webkit
  end

  test "acabar una generación" do
    visit update_generation_generic_cars_path
    first(:link, "Editar").click
    assert has_content?('Primer Año'), "no hay coche????"
    uncheck 'Generación Continua'
    fill_in 'Años', with: '2003-2009'
    click_button 'Actualizar Coche Genérico'
    assert has_content?('El Carro fue editado con éxito')
  end

  test "seleccionar un coche y asignarle una fotografía" do
    # visit generic_cars_path
    # first(:link, "Editar").click
    # # first(:file_field, "Imagen").attach_file 'Imagen', File.join(Rails.root, 'public', 'assets', 'images', 'corolla.png')
    # #NO ENCUENTRA LA PRIMERA IMAGEN?
    #
    # #attach_file 'Imagen', File.join(Rails.root, 'public', 'assets', 'images', 'corolla.png')
    # click_button('Guardar Coche')
    # assert has_content?('Guardado con éxito'), "fracasa al guardar"
    # assert_not_nil(GenericCar.order('created_at').last.generic_car_images)
  end

  test "poder editar piezas dentro de una familia ya asignada al coche" do
    visit generic_cars_path
    fill_in 'Search:', with: 'corolla'
    first(:link, "Familias").click
    first(:link, "Editar Familia").click
    assert has_content?("Agregar Pieza"), "no halló piezas"
  end

  test "poder crear variante dentro de una familia ya asignada al coche" do
    visit generic_cars_path
    fill_in 'Search:', with: 'corolla'
    first(:link, "Familias").click
    first(:link, "Crear Variante").click
    assert has_content?("CREAR VARIANTE"), "no halló variante"
  end

  test "dar de alta vehículos genéricos sin foto" do
    assert_difference "GenericCar.count", +1 do
      visit new_generic_car_path
      #fill in campos
      select 'Toyota', from: 'Marca'
      fill_in 'Modelo', with: 'Tacoma'
      fill_in 'Iniciales', with: 'TA'
      check "Generación Continua"
      fill_in 'Primer Año', with: '1990'
      select "SUV", from: "Tipo de coche"
      #click Crear
      click_button('Guardar Coche')
      assert has_content?('Guardado con éxito'), "fracasa al guardar"
    end
  end

  test "dar de alta vehículos genéricos con 1 fotografía" do
    assert_difference "GenericCar.count", +1 do
      visit new_generic_car_path
      #fill in campos
      select 'Toyota', from: 'Marca'
      fill_in "Modelo", with: 'Corolla'
      fill_in 'Iniciales', with: 'TO'
      check "Generación Continua"
      fill_in 'Primer Año', with: '1990'
      select "SUV", from: "Tipo de coche"
      attach_file 'Imagen', File.join(Rails.root, 'public', 'assets', 'images', 'corolla.png')
      #click Crear
      click_button('Guardar Coche')
      assert has_content?('Guardado con éxito'), "fracasa al guardar"
      assert_not_nil(GenericCar.order('created_at').last.generic_car_images)
    end
  end

end
