require 'spec_helper'

describe "zombies/edit" do
  before(:each) do
    @zombie = assign(:zombie, stub_model(Zombie))
  end

  it "renders the edit zombie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", zombie_path(@zombie), "post" do
    end
  end
end
