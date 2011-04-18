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

	def more_link(h)
		if h.description.length > 50
			link_to_function("more", nil, :id => "1") do |page|
				page["desc#{h.id}"].replace_html "#{h.description}"
			end
		end
	end

end
