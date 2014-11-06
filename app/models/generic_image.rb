class GenericImage < ActiveRecord::Base
  belongs_to :generic_car
  belongs_to :generic_spare, dependent: :destroy

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

end
