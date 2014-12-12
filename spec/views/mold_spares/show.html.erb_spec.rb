require 'spec_helper'

describe "mold_spares/show" do
  before(:each) do
    @mold_spare = assign(:mold_spare, stub_model(MoldSpare,
      :name => "Name",
      :comment => "Comment",
      :comment2 => "Comment2",
      :mold_type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Comment/)
    rendered.should match(/Comment2/)
    rendered.should match(/Type/)
  end
end
