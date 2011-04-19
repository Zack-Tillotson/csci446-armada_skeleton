class CreateUserFavoritesTable < ActiveRecord::Migration
  def self.up
    create_table "user_favorites" do |t|
      t.column "user_id", :integer
      t.column "harvester_id", :integer
    end
  end

  def self.down
    drop_table "user_favorites"
  end
end
