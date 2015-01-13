require 'spec_helper'

describe "model_acronyms/index" do
  before(:each) do
    assign(:model_acronyms, [
      stub_model(ModelAcronym,
        :brand_id => 1,
        :acronym => "Acronym"
      ),
      stub_model(ModelAcronym,
        :brand_id => 1,
        :acronym => "Acronym"
      )
    ])
  end

  it "renders a list of model_acronyms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Acronym".to_s, :count => 2
  end
end
