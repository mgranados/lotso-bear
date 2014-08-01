require 'spec_helper'
describe "Stock Spare Part Modelo -" do
  before do
    @stockSparePart = FactoryGirl.create(:stock_spare_part)
  end

  subject{@stockSparePart}

  it { should be_valid }
  it { should respond_to :status }
  it { should respond_to :idWarehouse }
  it { should respond_to :idWorkshopCar }
  it { should respond_to :color }
  it { should respond_to :idSparePart }


  describe "Valida presencia status" do
    before{@stockSparePart.status = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia idSparePart" do
    before{@stockSparePart.idSparePart = nil}
    it{ should_not be_valid }
  end


end
