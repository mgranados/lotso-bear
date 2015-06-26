require 'spec_helper'

describe "stock_cars/index" do
  before(:each) do
    assign(:stock_cars, [
      stub_model(StockCar),
      stub_model(StockCar)
    ])
  end

  it "renders a list of stock_cars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
