require 'spec_helper'

describe "brands/edit" do
  before(:each) do
    @brand = assign(:brand, stub_model(Brand,
      :name => "MyString",
      :acronym => "MyString"
    ))
  end

  it "renders the edit brand form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brand_path(@brand), "post" do
      assert_select "input#brand_name[name=?]", "brand[name]"
      assert_select "input#brand_acronym[name=?]", "brand[acronym]"
    end
  end
end
