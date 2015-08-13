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
    end #generic family added

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

  test "search for family that exists with its code" do
    visit search_generic_families_path
    assert has_content?('Buscar'), "No llega a búsqueda"
    #search for a code
    fill_in :family,     with: @generic_family.code
    click_button "Buscar"
    assert has_content?(@generic_family.code), "No encuentra #{@generic_family.code}"
  end

  test "search for family that doesn't exists with its code" do
    visit search_generic_families_path
    assert has_content?('Buscar'), "No llega a búsqueda"
    #search for a code
    fill_in :family,     with: 'FASFASDSADFASDASFA'
    click_button "Buscar"
    assert has_content?('No se encontró ningún resultado.'), "No avisa que no halló"
  end

  #search for family w car
  test "search for a family with a car" do
    visit search_generic_families_path
    assert has_content?('Buscar'), "No llega a búsqueda"
    #search for a code
    fill_in :model,     with: "COROLLA"
    click_button "Buscar"
    assert has_content?("COROLLA"), "No encuentra COROLLA"
  end

  #assign to a vehicle
  test "assign a generic family to a vehicle" do
    visit assigned_generic_families_path
    assert has_content?('Asignación de familias a vehículos')
  end

  # agregar piezas
  test "assign a spare to the family" do

  end

  # agregar variantes
  test "add versions of a same spare to the generic family" do

  end

  #assign to a supplier
  test "assign a generic family to a supplier" do
    visit admin_suppliers_path
    assert has_content?('ASIGNACIÓN DE FAMILIAS A VEHÍCULOS')
  end

  #assign a price
  test "assign a generic family an specific price" do
    visit admin_prices_path
    assert has_content?('ADMINISTRACIÓN DE PRECIOS')
  end


end
