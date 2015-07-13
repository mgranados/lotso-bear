require 'spec_helper'

describe "shelves/new" do
  before(:each) do
    assign(:shelf, stub_model(Shelf,
      :aisle => "MyString",
      :row => "MyString",
      :level => 1,
      :number => 1
    ).as_new_record)
  end

  it "renders new shelf form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shelves_path, "post" do
      assert_select "input#shelf_aisle[name=?]", "shelf[aisle]"
      assert_select "input#shelf_row[name=?]", "shelf[row]"
      assert_select "input#shelf_level[name=?]", "shelf[level]"
      assert_select "input#shelf_number[name=?]", "shelf[number]"
    end
  end
end
