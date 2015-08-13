require 'test_helper'

class GenericFamiliesTest < ActionDispatch::IntegrationTest
  #add a new family
  test "Add a new family" do
    visit new_generic_family_path
    #check we're creating a new family
    assert has_content? 'Crear Familia Generica'
    #Fill up w/o spares
    
  end
  #search for family w code
  test "Search for family with a code" do

  end
  #search for family w car
  test "Search for a family with a car" do

  end
  #assign to a vehicle
  test "Assign a generic family to a vehicle" do

  end
  #assign to a supplier
  test "Assign a generic family to a supplier" do

  end
  #assign a price
  test "Assign a generic family an specific price" do

  end
  # agregar piezas
  test "Assign a " do

  end
  # agregar variantes
  test "Add versions of a same spare to the generic family" do

  end
end
