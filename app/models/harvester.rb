class Harvester < ActiveRecord::Base

	belongs_to :user

	has_attached_file :photo, :styles => { :icon => "50x50", :small => "150x150>" }, :url  => "/assets/products/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension", :default_url => '/images/default.png'
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
	
end
