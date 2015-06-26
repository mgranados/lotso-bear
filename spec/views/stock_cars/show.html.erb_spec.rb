require 'spec_helper'

describe "stock_cars/show" do
  before(:each) do
    @stock_car = assign(:stock_car, stub_model(StockCar))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
