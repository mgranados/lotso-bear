require 'spec_helper'

describe "shelves/edit" do
  before(:each) do
    @shelf = assign(:shelf, stub_model(Shelf,
      :aisle => "MyString",
      :row => "MyString",
      :level => 1,
      :number => 1
    ))
  end

  it "renders the edit shelf form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shelf_path(@shelf), "post" do
      assert_select "input#shelf_aisle[name=?]", "shelf[aisle]"
      assert_select "input#shelf_row[name=?]", "shelf[row]"
      assert_select "input#shelf_level[name=?]", "shelf[level]"
      assert_select "input#shelf_number[name=?]", "shelf[number]"
    end
  end
end
