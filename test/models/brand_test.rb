class BrandTest < ActiveSupport::TestCase
  require 'test_helper'
  def setup
  	@brand = brands(:toyota)
  end

  test "should not save brand without name" do
  	@brand.name = nil
  	assert_not @brand.save
  end
  
  test "should not save brand without acronym" do
  	@brand.acronym = nil
  	assert_not @brand.save
  end

end
