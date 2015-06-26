require "spec_helper"

describe StockCarsController do
  describe "routing" do

    it "routes to #index" do
      get("/stock_cars").should route_to("stock_cars#index")
    end

    it "routes to #new" do
      get("/stock_cars/new").should route_to("stock_cars#new")
    end

    it "routes to #show" do
      get("/stock_cars/1").should route_to("stock_cars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stock_cars/1/edit").should route_to("stock_cars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stock_cars").should route_to("stock_cars#create")
    end

    it "routes to #update" do
      put("/stock_cars/1").should route_to("stock_cars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stock_cars/1").should route_to("stock_cars#destroy", :id => "1")
    end

  end
end
