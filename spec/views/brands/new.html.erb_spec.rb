require 'spec_helper'

describe "brands/new" do
  before(:each) do
    assign(:brand, stub_model(Brand,
      :name => "MyString",
      :acronym => "MyString"
    ).as_new_record)
  end

  it "renders new brand form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brands_path, "post" do
      assert_select "input#brand_name[name=?]", "brand[name]"
      assert_select "input#brand_acronym[name=?]", "brand[acronym]"
    end
  end
end
