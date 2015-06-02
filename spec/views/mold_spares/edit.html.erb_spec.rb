# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "mold_spares/edit" do
  before(:each) do
    @mold_spare = assign(:mold_spare, stub_model(MoldSpare,
      :name => "MyString",
      :comment => "MyString",
      :comment2 => "MyString",
      :type => ""
    ))
  end

  it "renders the edit mold_spare form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mold_spare_path(@mold_spare), "post" do
      assert_select "input#mold_spare_name[name=?]", "mold_spare[name]"
      assert_select "input#mold_spare_comment[name=?]", "mold_spare[comment]"
      assert_select "input#mold_spare_comment2[name=?]", "mold_spare[comment2]"
      assert_select "input#mold_spare_type[name=?]", "mold_spare[type]"
    end
  end
end
