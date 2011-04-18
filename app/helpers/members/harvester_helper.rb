module Members::HarvesterHelper

	def links(h)
		if current_user.id==h.user_id
			render :partial => :links
		end
	end

end