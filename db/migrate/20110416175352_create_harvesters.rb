class CreateHarvesters < ActiveRecord::Migration

	def self.up
		create_table :harvesters do |t|
			t.string :name, :null => false
			t.decimal :price, :null => false
			t.text :description, :null => false
			t.photo_file_name :string, :null => false
			t.photo_content_type :string, :null => false
			t.photo_file_size :integer, :null => false
			t.photo_updated_at :datetime, :null => false
			t.timestamps
		end
	end

	def self.down
		drop_table :delayed_jobs
	end
	
end