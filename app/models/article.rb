class Article < ActiveRecord::Base
  
  has_attached_file :photo, :styles => { :thumb => "100x300", :original => "600x300"},
  :url => "/upload_images/:id/:style/:basename.:extension",
  :path => ":rails_root/public/upload_images/:id/:style/:basename.:extension"
  
  validates :title, presence: true, length: {minimum: 5}
  validates :content, presence: true, length: {minimum: 10}
  validates :status, presence: true
  validates_attachment_presence :photo
  validates_attachment_size :photo, :in => 0..200.kilobytes
  validates_attachment_content_type :photo, :content_type => ['image/pjpeg', 'image/jpg', 'image/jpeg', 'image/png']
  
  scope :status_active, -> {where(status: 'active')}
end
