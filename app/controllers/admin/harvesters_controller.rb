class Admin::HarvestersController < Admin::AdminController

	HARVESTERS_PER_PAGE = 5

	def index
		@harvesters = Harvester.paginate(:page => params[:page], :per_page => HARVESTERS_PER_PAGE)
		respond_to do |format|
			format.html
			format.xml  { render :xml => @harvester }
		end
	end

	def show
		@harvester = Harvester.find(params[:id])
		respond_to do |format|
			format.html
			format.xml  { render :xml => @harvester }
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
				format.html { redirect_to admin_root_url }
				format.xml  { render :xml => @harvester }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @harvester.errors }
			end
		end
	end

  def destroy
	 @harvester = Harvester.find(params[:id])
    respond_to do |format|
      if @harvester.destroy
        flash[:success] = 'Harvester was successfully destroyed.'        
        format.html { redirect_to admin_home_url }
        format.xml  { head :ok }
      else
        flash[:error] = 'Harvester could not be destroyed.'
        format.html { redirect_to admin_harvester_url(@harvester) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

end
