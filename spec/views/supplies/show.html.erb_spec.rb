require 'spec_helper'

describe "supplies/show" do
  before(:each) do
    @supply = assign(:supply, stub_model(Supply,
      :name => "Name",
      :minimum_qty => 1,
      :cost => 2,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
  end
end
