# -*- encoding : utf-8 -*-
require "spec_helper"

describe MoldSparesController do
  describe "routing" do

    it "routes to #index" do
      get("/mold_spares").should route_to("mold_spares#index")
    end

    it "routes to #new" do
      get("/mold_spares/new").should route_to("mold_spares#new")
    end

    it "routes to #show" do
      get("/mold_spares/1").should route_to("mold_spares#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mold_spares/1/edit").should route_to("mold_spares#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mold_spares").should route_to("mold_spares#create")
    end

    it "routes to #update" do
      put("/mold_spares/1").should route_to("mold_spares#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mold_spares/1").should route_to("mold_spares#destroy", :id => "1")
    end

  end
end
