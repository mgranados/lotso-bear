require 'spec_helper'

describe "shelves/show" do
  before(:each) do
    @shelf = assign(:shelf, stub_model(Shelf,
      :aisle => "Aisle",
      :row => "Row",
      :level => 1,
      :number => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Aisle/)
    rendered.should match(/Row/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
