module UserSessionsHelper
	def edit_profile
		if current_user.is_admin?
			render :partial => 'layouts/admin_name'
		else
			render :partial => 'layouts/members_name'
		end
	end
end
