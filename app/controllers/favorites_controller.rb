class FavoritesController < ApplicationController

  def create
    @f = Favorite.new(params[:favorite])
    @f.save
    flash[:notice] = "Harvester added to favorites"
    respond_to do |format|
      format.html { redirect_to members_path} 
      format.js
    end
  end

   def destroy
    @f = Favorite.find(params[:id])
    respond_to do |format|
      @f.destroy
      flash[:notice] = "Harvester removed from favorites"
      format.html { redirect_to members_path }
      format.js
    end
  end

end
