# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "model_acronyms/show" do
  before(:each) do
    @model_acronym = assign(:model_acronym, stub_model(ModelAcronym,
      :brand_id => 1,
      :acronym => "Acronym"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Acronym/)
  end
end
