def Favorite < ActiveRecord::Base

  belongs_to :user
  belongs_to :harvester

end
