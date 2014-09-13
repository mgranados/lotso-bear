class Prevaluation < ActiveRecord::Base
  has_many :cars
  has_many :insureds
  accepts_nested_attributes_for :cars, :insureds

  # Paperclip Photo Upload
  has_attached_file :photo1, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :photo2, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :photo3, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :photo4, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :doc1, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :doc2, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :doc3, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_attached_file :doc4, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :photo1, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo2, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo3, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :photo4, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :doc1, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :doc2, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :doc3, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :doc4, :content_type => /\Aimage\/.*\Z/
end
