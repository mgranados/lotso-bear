require 'spec_helper'

describe "subsections/show" do
  before(:each) do
    @subsection = assign(:subsection, stub_model(Subsection,
      :code => "Code",
      :name => "Name",
      :section_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
