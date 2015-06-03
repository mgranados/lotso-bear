require 'spec_helper'

describe "sections/new" do
  before(:each) do
    assign(:section, stub_model(Section,
      :code => "MyString",
      :warehouse_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sections_path, "post" do
      assert_select "input#section_code[name=?]", "section[code]"
      assert_select "input#section_warehouse_id[name=?]", "section[warehouse_id]"
      assert_select "input#section_name[name=?]", "section[name]"
    end
  end
end
