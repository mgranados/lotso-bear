require 'spec_helper'

describe "zombies/index" do
  before(:each) do
    assign(:zombies, [
      stub_model(Zombie),
      stub_model(Zombie)
    ])
  end

  it "renders a list of zombies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
