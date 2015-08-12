require 'spec_helper'

describe "zombies/show" do
  before(:each) do
    @zombie = assign(:zombie, stub_model(Zombie))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
