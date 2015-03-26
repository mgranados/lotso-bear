require 'spec_helper'

describe "suppliers/index" do
  before(:each) do
    assign(:suppliers, [
      stub_model(Supplier,
        :name => "Name",
        :supplier_type_id => "Supplier Type"
      ),
      stub_model(Supplier,
        :name => "Name",
        :supplier_type_id => "Supplier Type"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Supplier Type".to_s, :count => 2
  end
end
