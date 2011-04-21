class ChangeTableName < ActiveRecord::Migration
  def self.up
    drop_table "user_favorites"
    create_table "favorites" do |t|
      t.column "user_id", :integer
      t.column "harvester_id", :integer
    end
  end

  def self.down
    drop_table "favorites"
    create_table "user_favorites" do |t|
      t.column "user_id", :integer
      t.column "harvester_id", :integer
    end
  end 
end
