module HarvesterHelper

	def harvesters_list(h)
		if h.empty?
			content_tag :p do
				"No harvesters have been created."
			end
		else
			render :partial => 'global/list', :locals => {:harvesters => h}
		end
	end

	def more_link(h)
		if h.description.length > 50
			link_to_function("more", nil, :id => "1") do |page|
				page["desc#{h.id}"].replace_html "#{h.description}"
			end
		end
	end

	def links(h)
		if current_user
			if current_user.is_admin?
				render :partial => 'admin/harvesters/links', :locals => {:harvester => h}
			else
				if current_user.id==h.user_id 
					render :partial => 'members/harvesters/links', :locals => {:harvester => h}
				end
			end
		end
	end

  def show_favorite_star(h, u)

    if u != nil
      if h.favorite?(u)
        render :partial => "/members/harvesters/favorite", :locals => { :h => h, :u => u, :fav => true }
      else
        render :partial => "/members/harvesters/favorite", :locals => { :h => h, :u => u, :fav => false }
      end
    end

  end

  def fav_form_url(h, u)

      if(f = Favorite.find(:first, :conditions => {:harvester_id => h.id, :user_id => u.id}))
        "/"
      else
        "/"
      end

  end

end
