# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "mold_spares/new" do
  before(:each) do
    assign(:mold_spare, stub_model(MoldSpare,
      :name => "MyString",
      :comment => "MyString",
      :comment2 => "MyString",
      :type => ""
    ).as_new_record)
  end

  it "renders new mold_spare form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mold_spares_path, "post" do
      assert_select "input#mold_spare_name[name=?]", "mold_spare[name]"
      assert_select "input#mold_spare_comment[name=?]", "mold_spare[comment]"
      assert_select "input#mold_spare_comment2[name=?]", "mold_spare[comment2]"
      assert_select "input#mold_spare_type[name=?]", "mold_spare[type]"
    end
  end
end
