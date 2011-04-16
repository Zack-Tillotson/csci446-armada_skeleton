class AddAttachmentsPhotoToHarvester < ActiveRecord::Migration
  def self.up
    add_column :harvesters, :photo_file_name, :string
    add_column :harvesters, :photo_content_type, :string
    add_column :harvesters, :photo_file_size, :integer
    add_column :harvesters, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :harvesters, :photo_file_name
    remove_column :harvesters, :photo_content_type
    remove_column :harvesters, :photo_file_size
    remove_column :harvesters, :photo_updated_at
  end
end
