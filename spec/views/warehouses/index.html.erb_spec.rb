require 'spec_helper'

describe "warehouses/index" do
  before(:each) do
    assign(:warehouses, [
      stub_model(Warehouse),
      stub_model(Warehouse)
    ])
  end

  it "renders a list of warehouses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
