require 'spec_helper'

describe "subsections/index" do
  before(:each) do
    assign(:subsections, [
      stub_model(Subsection,
        :code => "Code",
        :section_id => 1,
        :name => "Name"
      ),
      stub_model(Subsection,
        :code => "Code",
        :section_id => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of subsections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
