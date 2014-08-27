require 'spec_helper'

describe "SparePart" do
  before{@sparePart = FactoryGirl.create(:spare_part)}
  subject{@sparePart}

  it "Belongs to Car" do should belong_to(:car) end
  it "Responds to name" do should respond_to(:sparePartName) end

end
