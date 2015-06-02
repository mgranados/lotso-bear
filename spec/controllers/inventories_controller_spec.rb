# -*- encoding : utf-8 -*-
require 'spec_helper'

describe InventoriesController do

  describe "GET 'entrance'" do
    it "returns http success" do
      get 'entrance'
      response.should be_success
    end
  end

  describe "GET 'departure'" do
    it "returns http success" do
      get 'departure'
      response.should be_success
    end
  end

end
