class Role < ActiveRecord::Base

	has_paper_trail
  validates_presence_of :name
	validates_length_of :name, :minimum => 1
	validates_uniqueness_of :name
	has_many :users

	def to_s
		self.name
	end

protected

	def after_initialize
		if new_record? then
			#puts "Name is: #{self.name}"
			if(self.name?)
        self.name = self.name.strip.downcase
      end
			#puts "Name is now: #{self.name}"
		end
	end

end

# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  users_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
