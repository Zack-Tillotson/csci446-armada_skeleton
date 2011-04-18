module HarvesterHelper

	def harvesters_list(h)
		if h.empty?
			content_tag :p do
				"No harvesters have been created."
			end
		else
			render :partial => 'list', :locals => {:harvesters => h}
		end
	end

	def harvester_show(h)
    render :partial => 'fullharvester', :locals => {:harvester => h}
	end


end
