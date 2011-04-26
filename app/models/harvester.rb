class Harvester < ActiveRecord::Base

	belongs_to :user
	before_validation :set_user
	has_many :favorites
	has_many :users, :through => :favorites
  validates_numericality_of :price
  validates_presence_of :price

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

  def toggle_favorite!(user)
    if(self.favorite?(user))
      Favorite.find(:first, :conditions => {:harvester_id => self.id, :user_id => user.id}).destroy
      false
    else
      f = Favorite.new({:user_id => user.id, :harvester_id => self.id})
      f.save
      true
    end
  end


protected

	def set_user
		self.user_id = UserSession.find.record.id if self.user_id.nil?
	end

end
