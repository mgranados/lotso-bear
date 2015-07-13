require 'spec_helper'

describe "shelves/index" do
  before(:each) do
    assign(:shelves, [
      stub_model(Shelf,
        :aisle => "Aisle",
        :row => "Row",
        :level => 1,
        :number => 2
      ),
      stub_model(Shelf,
        :aisle => "Aisle",
        :row => "Row",
        :level => 1,
        :number => 2
      )
    ])
  end

  it "renders a list of shelves" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Aisle".to_s, :count => 2
    assert_select "tr>td", :text => "Row".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
