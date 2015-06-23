require 'spec_helper'

describe "supplies/edit" do
  before(:each) do
    @supply = assign(:supply, stub_model(Supply,
      :name => "MyString",
      :minimum_qty => 1,
      :cost => 1,
      :description => "MyString"
    ))
  end

  it "renders the edit supply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supply_path(@supply), "post" do
      assert_select "input#supply_name[name=?]", "supply[name]"
      assert_select "input#supply_minimum_qty[name=?]", "supply[minimum_qty]"
      assert_select "input#supply_cost[name=?]", "supply[cost]"
      assert_select "input#supply_description[name=?]", "supply[description]"
    end
  end
end
