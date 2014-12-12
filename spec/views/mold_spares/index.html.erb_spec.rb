require 'spec_helper'

describe "mold_spares/index" do
  before(:each) do
    assign(:mold_spares, [
      stub_model(MoldSpare,
        :name => "Name",
        :comment => "Comment",
        :comment2 => "Comment2",
        :type => "Type"
      ),
      stub_model(MoldSpare,
        :name => "Name",
        :comment => "Comment",
        :comment2 => "Comment2",
        :type => "Type"
      )
    ])
  end

  it "renders a list of mold_spares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Comment".to_s, :count => 2
    assert_select "tr>td", :text => "Comment2".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
