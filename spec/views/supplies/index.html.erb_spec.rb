require 'spec_helper'

describe "supplies/index" do
  before(:each) do
    assign(:supplies, [
      stub_model(Supply,
        :name => "Name",
        :minimum_qty => 1,
        :cost => 2,
        :description => "Description"
      ),
      stub_model(Supply,
        :name => "Name",
        :minimum_qty => 1,
        :cost => 2,
        :description => "Description"
      )
    ])
  end

  it "renders a list of supplies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
