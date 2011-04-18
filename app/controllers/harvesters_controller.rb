class HarvestersController < ApplicationController

  before_filter :require_user, :only => [:new, :create]

	HARVESTERS_PER_PAGE = 5

	def index
		@harvesters = Harvester.paginate(:page => params[:page], :per_page => HARVESTERS_PER_PAGE)
		respond_to do |format|
			format.html
			format.xml  { render :xml => @harvesters }
		end
	end

	def show
		@harvester = Harvester.find(params[:id])
		respond_to do |format|
			format.html
			format.xml  { render :xml => @harvester }
    end
  end

end
