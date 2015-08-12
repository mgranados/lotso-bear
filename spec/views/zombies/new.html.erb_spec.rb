require 'spec_helper'

describe "zombies/new" do
  before(:each) do
    assign(:zombie, stub_model(Zombie).as_new_record)
  end

  it "renders new zombie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", zombies_path, "post" do
    end
  end
end
