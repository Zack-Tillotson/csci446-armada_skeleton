class AddUserToHarvester < ActiveRecord::Migration
  def self.up
    add_column :harvesters, :user_id, :integer
  end

  def self.down
    remove_column :harvesters, :user_id
  end
end
