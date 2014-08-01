require 'spec_helper'
describe "Car Modelo -" do
  before do
    @car = FactoryGirl.create(:car)
  end

  subject{@car}

  it { should be_valid }
  it { should respond_to :model }
  it { should respond_to :idBrand }
  it { should respond_to :carType }
  it { should respond_to :year }
  it { should respond_to :generation }


  describe "Valida presencia model" do
    before{@car.model = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia idbrand" do
    before{@car.idBrand = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia carType" do
    before{@car.carType = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia year" do
    before{@car.year = nil}
    it{ should_not be_valid }
  end

  describe "Valida presencia generation" do
    before{@car.generation = nil}
    it{ should_not be_valid }
  end

  describe "Checa que los coches sean unicos" do
    it{FactoryGirl.build(:car, model: @car.model, carType: @car.carType).should_not be_valid}
  end

end
