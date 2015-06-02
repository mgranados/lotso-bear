# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Relationships" do
  describe "A car with a Spare Part" do
    before{ @car = FactoryGirl.create(:car)}
    subject {@car.spare_part}
    it ", the car responds to a spare_part" do should respond_to(:idSparePart) end
  end

end
