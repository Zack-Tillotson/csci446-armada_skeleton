module Members::HarvesterHelper

	def links(h)
		if current_user.id==h.user_id
			render :partial => 'links', :locals => {:harvester => h}
		end
	end

end