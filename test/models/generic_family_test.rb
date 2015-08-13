require 'test_helper'

class GenericFamilyTest < ActiveSupport::TestCase
  def setup
    @generic_family = generic_families(:faro_cromado)
  end

  test "should not save car without name" do
    @generic_family.name = nil
    assert_not @generic_family.save
  end
  
  test "should not save without code" do
    @generic_family.code = nil
    assert_not @generic_family.save
  end

  test "should be valid" do
    assert @generic_family.valid?, "#{@generic_family.errors.first}"
  end

  test "should respond to childs relation" do
    assert_respond_to @generic_family, :childs
  end

  test "should respond to father relation " do
    assert_respond_to @generic_family, :father
  end

  test "should respond to generic_spares relation" do
    assert_respond_to @generic_family, :generic_spares
  end

  test "should respond to stock_families relation" do
    assert_respond_to @generic_family, :stock_families
  end

  test "should respond to car_types relation" do
    assert_respond_to @generic_family, :car_types
  end

  test "should respond to generic_cars relation" do
    assert_respond_to @generic_family, :generic_cars
  end

  test "should respond to suppliers relation" do
    assert_respond_to @generic_family, :suppliers
  end

  test "should contain childs (generic_families)" do
  	generic_family = generic_families(:faro_cromado_padre)
  	assert generic_family.childs.count > 0
  end

  test "should add copies of families to corresponding car types" do
  	assert_difference 'GenericFamily.count', +2 do
      # Select a type_likelihood to use as parameter
  		type_likelihood = type_likelihoods(:one)
      #Call the method
  		GenericFamily.add_to_corresponding_cars(type_likelihood)
  	end
  end

  test "should add copies of families to corresponding car types (testing with 500 cars and 1 type)" do
    assert_difference 'GenericFamily.count', +500 do
      type_likelihood = type_likelihoods(:two)
      GenericFamily.add_to_corresponding_cars(type_likelihood)
    end
  end

  test "testing not_assigned_families, should not return records of families who have a typelikeilihood" do
    generic_families =  GenericFamily.not_assigned_families
    assert_equal 1, generic_families.count
  end

  test "testing assigned_families, should return records of families who have a typelikeilihood" do
    # New
    generic_families =  GenericFamily.assigned_families
    assert_equal 2, generic_families.count
  end

  test "testing assignation, should return records not asigned to a given car" do
    generic_car = generic_cars(:corolla)
    generic_families =  GenericFamily.other_families(generic_car)
    assert_equal 2, generic_families.count
  end

  test "testing generate_stock_family_with_stock_spares, should return a stock_families" do
    generic_car = generic_cars(:corolla)
    generic_spare = generic_spares(:manija)
    # Call the method
    generic_family =  @generic_family.generate_stock_family_with_stock_spares([{"id"=>generic_spare.id, "supplier_code"=>"asdf", "color"=>"asdf"}], generic_car.id)
    # Checks it creates an instance of StockFamily
    assert_instance_of StockFamily, generic_family
    # Checks the new GenericFamily instance is not blank
    assert_not generic_family.blank? 
  end

  test "name_with_code return name correctly formated" do
    assert_equal "Faro Cromado, FC", @generic_family.name_with_code
  end

  test "clone_generic_family_with_generic_spares" do
    #Clone the family
    clone_family = @generic_family.clone_generic_family_with_generic_spares
    # Checks it creates an instance of StockFamily
    assert_instance_of GenericFamily, clone_family
    # Check the clone is not blank
    assert_not clone_family.blank?
    #Check the copy has the same number of spares as the original
    assert_equal @generic_family.generic_spares, clone_family.generic_spares
  end

end
