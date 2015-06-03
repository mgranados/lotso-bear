require "spec_helper"

describe SubsectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/subsections").should route_to("subsections#index")
    end

    it "routes to #new" do
      get("/subsections/new").should route_to("subsections#new")
    end

    it "routes to #show" do
      get("/subsections/1").should route_to("subsections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/subsections/1/edit").should route_to("subsections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/subsections").should route_to("subsections#create")
    end

    it "routes to #update" do
      put("/subsections/1").should route_to("subsections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/subsections/1").should route_to("subsections#destroy", :id => "1")
    end

  end
end
