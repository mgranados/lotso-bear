require 'spec_helper'

describe "subsections/new" do
  before(:each) do
    assign(:subsection, stub_model(Subsection,
      :code => "MyString",
      :section_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new subsection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subsections_path, "post" do
      assert_select "input#subsection_code[name=?]", "subsection[code]"
      assert_select "input#subsection_section_id[name=?]", "subsection[section_id]"
      assert_select "input#subsection_name[name=?]", "subsection[name]"
    end
  end
end
