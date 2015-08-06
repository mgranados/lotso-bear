# -*- encoding : utf-8 -*-
class ModelAcronymTest < ActiveSupport::TestCase
  require 'test_helper'


  test "should not save modelAcronym without brand" do
    model_acronym = model_acronyms(:corolla)
    model_acronym.brand = nil
    assert_not model_acronym.save
  end

  test "should not save modelAcronym without model" do
    model_acronym = model_acronyms(:corolla)
    model_acronym.model = nil
    assert_not model_acronym.save
  end

  test "should not save modelAcronym without initials" do
    model_acronym = model_acronyms(:corolla)
    model_acronym.initials = nil
    assert_not model_acronym.save
  end

  test "should not save if model exist" do
      model_acronym = ModelAcronym.new(model:"COROLLA")
      assert_not model_acronym.save
  end

  test "should not save model if initials are already used" do
    model_acronym_2 = model_acronyms(:corolla)
    model_acronym_2.model = "NewModel"
    assert_not  model_acronym_2.save
  end

  test "should return existing model if exist, database stays the same" do
    assert_no_difference 'ModelAcronym.count' do
      model_acronym_2 = model_acronyms(:corolla)
      model_acronym_2.save
    end
  end


end
