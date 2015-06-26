require 'spec_helper'

describe "stock_cars/edit" do
  before(:each) do
    @stock_car = assign(:stock_car, stub_model(StockCar))
  end

  it "renders the edit stock_car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stock_car_path(@stock_car), "post" do
    end
  end
end
