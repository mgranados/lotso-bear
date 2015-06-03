require 'spec_helper'

describe "warehouses/new" do
  before(:each) do
    assign(:warehouse, stub_model(Warehouse).as_new_record)
  end

  it "renders new warehouse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", warehouses_path, "post" do
    end
  end
end
