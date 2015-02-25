class GenericCarTest < ActiveSupport::TestCase
  require 'test_helper'

  test "should not save car without model_acronym" do
    generic_car = generic_cars(:corolla)
    generic_car.model_acronym = nil
    assert_not generic_car.save
  end

  test "should not save car without car_type" do
    generic_car = generic_cars(:corolla)
    generic_car.car_type = nil
    assert_not generic_car.save
  end

  test "should not save car without years" do
    generic_car = generic_cars(:corolla)
    generic_car.years = nil
    assert_not generic_car.save
  end

  test "code generates correctly" do
    generic_car = generic_cars(:corolla)
    generic_car.save
    assert_equal( 'TY-1-CO', generic_car.code )
  end

  test "should not save car without number_of_generation" do
    generic_car = generic_cars(:corolla)
    generic_car.number_of_generation = nil
    assert_not generic_car.save
  end

  test "should save correct car" do
    assert generic_cars(:corolla).save
  end
end
