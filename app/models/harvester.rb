class Harvester < ActiveRecord::Base

	belongs_to :user
	before_validation :set_user
	has_many :favorites
	has_many :users, :through => :favorites

	has_attached_file	:photo,
							:styles => { :icon => "50x50", :small => "150x150>" },
							:url => "/assets/products/:id/:style/:basename.:extension",
							:path => "cs446/dragon/#{Rails.env}/:attachment/:id/:style/:basename.:extension",
							:default_url => '/images/default.png',
							:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
							:storage => :s3

	def to_s
		name
	end

  def favorite?(user)
    Favorite.exists?(['harvester_id = ? and user_id = ?', self.id, user.id])
  end


protected

	def set_user
		self.user_id = UserSession.find.record.id if self.user_id.nil?
	end

end
