# -*- encoding : utf-8 -*-
require "spec_helper"

describe ModelAcronymsController do
  describe "routing" do

    it "routes to #index" do
      get("/model_acronyms").should route_to("model_acronyms#index")
    end

    it "routes to #new" do
      get("/model_acronyms/new").should route_to("model_acronyms#new")
    end

    it "routes to #show" do
      get("/model_acronyms/1").should route_to("model_acronyms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/model_acronyms/1/edit").should route_to("model_acronyms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/model_acronyms").should route_to("model_acronyms#create")
    end

    it "routes to #update" do
      put("/model_acronyms/1").should route_to("model_acronyms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/model_acronyms/1").should route_to("model_acronyms#destroy", :id => "1")
    end

  end
end
