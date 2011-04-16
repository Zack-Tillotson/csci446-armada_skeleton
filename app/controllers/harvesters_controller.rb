class HarvestersController < ApplicationController

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
				format.xml  { render :xml => @harvester, :status => :created, :location => @harvester }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @harvester.errors, :status => :unprocessable_entity }
			end
		end
	end

end