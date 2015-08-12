require "spec_helper"

describe ZombiesController do
  describe "routing" do

    it "routes to #index" do
      get("/zombies").should route_to("zombies#index")
    end

    it "routes to #new" do
      get("/zombies/new").should route_to("zombies#new")
    end

    it "routes to #show" do
      get("/zombies/1").should route_to("zombies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/zombies/1/edit").should route_to("zombies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/zombies").should route_to("zombies#create")
    end

    it "routes to #update" do
      put("/zombies/1").should route_to("zombies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/zombies/1").should route_to("zombies#destroy", :id => "1")
    end

  end
end
