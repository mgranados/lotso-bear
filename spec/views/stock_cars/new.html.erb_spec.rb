require 'spec_helper'

describe "stock_cars/new" do
  before(:each) do
    assign(:stock_car, stub_model(StockCar).as_new_record)
  end

  it "renders new stock_car form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stock_cars_path, "post" do
    end
  end
end
