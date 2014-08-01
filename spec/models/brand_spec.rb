require 'spec_helper'
describe "Brand Modelo -" do
  before do
    @brand = FactoryGirl.create(:brand)
  end

  subject{@brand}

  it { should be_valid }
  it { should respond_to :name }

  describe "Valida presencia name" do
    before{@brand.name = nil}
    it{ should_not be_valid }
  end

  describe "El nombre es unico" do
    it{ FactoryGirl.build(:brand, name: @brand.name).should_not be_valid }
  end

end
