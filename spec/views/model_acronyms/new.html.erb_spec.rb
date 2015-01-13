require 'spec_helper'

describe "model_acronyms/new" do
  before(:each) do
    assign(:model_acronym, stub_model(ModelAcronym,
      :brand_id => 1,
      :acronym => "MyString"
    ).as_new_record)
  end

  it "renders new model_acronym form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", model_acronyms_path, "post" do
      assert_select "input#model_acronym_brand_id[name=?]", "model_acronym[brand_id]"
      assert_select "input#model_acronym_acronym[name=?]", "model_acronym[acronym]"
    end
  end
end
