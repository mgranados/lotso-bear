require 'spec_helper'

describe "SparePart Modelo" do
  before do
    @sparePart = FactoryGirl.create(:spare_part)
  end

  subject{@sparePart}

  it { should be_valid }
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :carRegion }
  it { should respond_to :parent }
  it { should respond_to :brand }
  it { should respond_to :spareCode }

  describe "Valida presencia name" do
    before{@sparePart.name = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia carRegion" do
    before{@sparePart.carRegion = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia brand" do
    before{@sparePart.brand = nil}
    it{ should_not be_valid }
  end
  describe "Valida presencia spareCode" do
    before{@sparePart.spareCode = nil}
    it{ should_not be_valid }
  end

  describe "SpareCode es unico" do
    it{ FactoryGirl.build(:spare_part, spareCode: @sparePart.spareCode).should_not be_valid }
  end

end
