require 'test_helper'

class GenericFamiliesTest < ActionDispatch::IntegrationTest

  def setup
    @generic_family = generic_families(:faro_cromado)
    @number_of_spares = 2
    Capybara.current_driver = :webkit

  end

  test "add a new family without spares" do
    assert_difference 'GenericFamily.count', +1 do
      visit new_generic_family_path
      #check we're creating a new family
      assert has_content?('NUEVA FAMILIA GENÉRICA'), "No llega a nueva familia"
      #Fill up w/o spares
      fill_in 'Nombre',     with: @generic_family.name
      fill_in 'Código',     with: @generic_family.code
      click_button 'Crear Familia Genérica'
      #check if it's created correctly
      assert has_content?('creada con éxito'), "Mensaje no aparece"
    end #assert_difference family added

  end

  test "add a new family with spares" do

    assert_difference 'GenericFamily.count', +1 do
      assert_difference "GenericSpare.count", +@number_of_spares do
      visit new_generic_family_path
      #check we're creating a new family
      assert has_content?('NUEVA FAMILIA GENÉRICA'), "No llega a nueva familia"
      #Fill up
      fill_in 'Nombre',     with: @generic_family.name
      fill_in 'Código',     with: @generic_family.code
      #create spares
      fill_in 'Número de Piezas',     with: @number_of_spares
      click_link 'Agregar Piezas'

      #Spares simulated have code
      for i in (0...@number_of_spares) do
        assert has_content?("#{@generic_family.code}#{i}"), "No encontró el código: #{@generic_family.code}#{i}"
      end

      #Fill in spares simulated
      for i in (0...@number_of_spares)do
        fill_in "Nombre Pieza #{i}", with: "Spare#{i}"
      end
      click_button 'Crear Familia Genérica'

      #check if it's created correctly
      assert has_content?('creada con éxito'), "Mensaje no aparece"
      assert has_content?('con piezas:'), "Mensaje con piezas no aparece"
      end #assert difference generic spares
    end #assert difference generic families
  end

  #assign to a vehicle
  test "assign a generic family to a vehicle" do
    visit assigned_generic_families_path
    assert has_content?('ASIGNACIÓN DE FAMILIAS A VEHÍCULOS')
    first('.btn').click_link('Edit')
    click_link('Guardar tipos coche')
    assert has_content?('Actualizado con éxito')
  end

  # agregar piezas
  test "edit a family related to car" do
    test "assign additional spare to the family" do
      #http://localhost:3000/generic_cars
      visit generic_cars_path
      #click familias
      first(:link, "Familias").click
      #click editar familia
      first(:link, "Editar Familia").click
      #click añadir Pieza
      click_link("Añadir Pieza")
      #fill si se puede
      #Guardar
      click_link("Guardar Cambios")
      #hascontent exito
      assert has_content?("Guardado con éxito")
    end

    test "remove spares from a family and save" do
      #http://localhost:3000/generic_cars
      visit generic_cars_path
      #click familias
      first(:link, "Familias").click
      #click editar familia
      first(:link, "Editar Familia").click
      #click remover Pieza (x o algo)
      first(:link, "x").click
      #Guardar
      click_link("Guardar Cambios")
      #hascontent exito
      assert has_content?("Guardado con éxito")
     end
  end

  # agregar variantes
  test "add a version of a same spare to the generic family" do
    #http://localhost:3000/variant
    visit generic_cars_path
    #click familias
    first(:link, "Familias").click
    #click editar familia
    first(:link, "Crear Variante").click    #agrega al codigo FC-01
    #añade pieza y fill in si se puede
    click_link("Añadir Pieza")
    #click a guardar variantes
    click_link("Guardar Cambios")
    #has content el codigo FC-01 en el listado
    assert has_content?("Guardado con éxito")

  end

  #assign to a supplier
  test "assign a generic family to a supplier" do
    visit admin_suppliers_path
    assert has_content?('TODOS LOS PROVEEDORES')
    assert has_content?('Agregar a')
  end

  #assign a price
  test "assign a generic family an specific price" do
    visit admin_prices_path
    assert has_content?('ADMINISTRACIÓN DE PRECIOS')
    assert has_content?('Asignar precio')
  end


end
