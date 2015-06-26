require 'spec_helper'

describe "StockCars" do
  describe "GET /stock_cars" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get stock_cars_path
      response.status.should be(200)
    end
  end
end
