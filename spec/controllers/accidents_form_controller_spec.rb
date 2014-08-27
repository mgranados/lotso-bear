require 'spec_helper'

describe AccidentsFormController do

  describe "GET 'fill'" do
    it "returns http success" do
      get 'fill'
      response.should be_success
    end
  end

end
