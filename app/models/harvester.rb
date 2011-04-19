class Harvester < ActiveRecord::Base

	belongs_to :user

	has_attached_file :photo, :styles => { :icon => "50x50", :small => "150x150>" }, :url  => "/assets/products/:id/:style/:basename.:extension", :path => "cs446/dragon/#{Rails.env}/:attachment/:id/:style/:basename.:extension", :default_url => '/images/default.png', :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :storage => :s3
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
	
end
