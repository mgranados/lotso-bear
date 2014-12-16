class GenericImage < ActiveRecord::Base
  belongs_to :generic_car, dependent: :destroy
  belongs_to :generic_spare, dependent: :destroy

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/



  before_validation { delete(fff.index) if @delete_image }

  def delete_image
    @delete_image ||= false
  end

  def delete_image=(value)
    @delete_image  = !value.to_i.zero?
  end

  
end
