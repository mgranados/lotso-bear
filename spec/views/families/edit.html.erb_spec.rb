# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "families/edit" do
  before(:each) do
    @family = assign(:family, stub_model(Family,
      :generic_spare_id => 1,
      :child_id => 1,
      :create => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit family form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", family_path(@family), "post" do
      assert_select "input#family_generic_spare_id[name=?]", "family[generic_spare_id]"
      assert_select "input#family_child_id[name=?]", "family[child_id]"
      assert_select "input#family_create[name=?]", "family[create]"
      assert_select "input#family_destroy[name=?]", "family[destroy]"
    end
  end
end
