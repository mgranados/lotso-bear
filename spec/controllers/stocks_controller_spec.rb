require 'spec_helper'

describe StocksController do

  describe "GET 'inventory'" do
    it "returns http success" do
      get 'inventory'
      response.should be_success
    end
  end

  describe "GET 'order'" do
    it "returns http success" do
      get 'order'
      response.should be_success
    end
  end

  describe "GET 'dispatch'" do
    it "returns http success" do
      get 'dispatch'
      response.should be_success
    end
  end

end
