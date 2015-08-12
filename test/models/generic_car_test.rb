# -*- encoding : utf-8 -*-
class GenericCarTest < ActiveSupport::TestCase
  require 'test_helper'

  def setup
    @generic_car = generic_cars(:corolla)
  end

  test "should not save car without model_acronym" do
    @generic_car.model_acronym = nil
    assert_not @generic_car.save
  end

  test "should not save car without car_type" do
    @generic_car.car_type = nil
    assert_not @generic_car.save
  end

  test "should not save car without years" do
    @generic_car.years = nil
    assert_not @generic_car.save
  end

  test "code generates correctly" do
    assert_equal 'TY1CO', @generic_car.code
  end

  test "should not save car without number_of_generation" do
    @generic_car.number_of_generation = nil
    assert_not @generic_car.save
  end

  test "first_generation_year generates correctly" do
    generic_car = generic_cars(:corsa)
    generic_car.save
    assert_equal 2001, generic_car.first_generation_year
  end

  test "last_generation_year generates correctly" do
    generic_car = generic_cars(:corsa)
    generic_car.save
    assert_equal 2004, generic_car.last_generation_year
  end

  test "car should be valid" do
    assert @generic_car.valid?, "#{@generic_car.errors.first}"
  end

  test "should contain generations" do
    @generic_car.save
    assert_equal @generic_car.generations.count, 4
  end

  test "should respond to stock_cars" do
    assert_respond_to @generic_car, :stock_cars
  end

  test "should respond to generic_fittables" do 
    assert_respond_to @generic_car, :generic_fittables
  end

  test "should respond to car_type" do
    assert_respond_to @generic_car, :car_type
  end

  test "should respond to model_acronym" do
    assert_respond_to @generic_car, :model_acronym
  end

  test "should respond to generic_car_generations" do
    assert_respond_to @generic_car, :generic_car_generations
  end

  test "should respond to generations" do
    assert_respond_to @generic_car, :generations
  end

  test "should respond to generic_car_images" do
    assert_respond_to @generic_car, :generic_car_images
  end

  test "should respond to model_acronym" do
    assert_respond_to @generic_car, :model_acronym
  end

  test "should respond to family_likelihoods" do
    assert_respond_to @generic_car, :family_likelihoods
  end

  test "should respond to generic_families" do
    assert_respond_to @generic_car, :generic_families
  end

end
