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

end
