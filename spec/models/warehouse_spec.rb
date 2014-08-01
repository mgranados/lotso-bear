require 'spec_helper'
describe "Stock Spare Part Modelo -" do
  before do
    @warehouse = FactoryGirl.create(:warehouse)
  end

  subject{@warehouse}

  it { should be_valid }
  it { should respond_to :branch }
  it { should respond_to :location }
  it { should respond_to :geoLocation }


  describe "Valida presencia branch" do
    before{@warehouse.branch = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia location" do
    before{@warehouse.location = nil}
    it{ should_not be_valid }
  end

  describe "Valida Uniqueness de un warehouse en branch" do
    it{ FactoryGirl.build(:warehouse, branch: @warehouse.branch).should_not be_valid }
  end

  describe "Valida Uniqueness de un warehouse en geolocation" do
    it{ FactoryGirl.build(:warehouse, geoLocation: @warehouse.geoLocation).should_not be_valid }
  end


end
