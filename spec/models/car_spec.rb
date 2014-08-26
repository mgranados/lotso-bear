require 'spec_helper'

describe "Car Model" do
before{ @car = FactoryGirl.create(:car) }

  describe "Car Columns" do
    subject {@car}

    it "idCar" do should respond_to(:id) end
  end
end
