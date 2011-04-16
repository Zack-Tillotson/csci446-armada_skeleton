class HarvestersController < ApplicationController

	HARVESTERS_PER_PAGE = 5

	def show
		@harvesters = Harvester.paginate(:page => params[:page], :per_page => HARVESTERS_PER_PAGE)
		respond_to do |format|
			format.html
			format.xml  { render :xml => @user }
		end
	end

	def new
		@harvester = Harvester.new
		respond_to do |format|
		format.html
		format.xml  { render :xml => @harvester }
		end
	end

	def create
		@harvester = Harvester.new(params[:harvester])
		respond_to do |format|
			if @harvester.save
				flash[:success] = 'Harvester was successfully created.'
				format.html
				format.xml  { render :xml => @harvester }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @harvester.errors }
			end
		end
	end

end