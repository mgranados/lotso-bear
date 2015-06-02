# -*- encoding : utf-8 -*-
class GenericFittable < ActiveRecord::Base
  belongs_to :generic_spare
  belongs_to :generic_car

end
