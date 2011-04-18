class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  filter_parameter_logging :password
  helper_method :current_user_session, :current_user, :home_url_for

  # A simple route for the application home page or root_url.
  def show
    render
  end

  protected
  
    def home_url_for(user)
      return root_url if user.nil?
      user.is_admin? ? admin_root_url : members_root_url
    end

  private
  
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
      return @current_user_session
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
      return @current_user
    end
        
     def require_user
       unless current_user
         flash[:notice] = "You must log in if you want to access that."
          if(!session[:return_to])
            store_location url_for(request.url)
          end
          redirect_to :login
          return false
       end
     end
     
     def require_no_user
       if current_user
         flash[:notice] = "You must be logged out to access #{request.path}. <a href=\"/logout\">log out</a>?"
         redirect_to home_url_for(current_user)
         return false
       end
     end

  def store_location(location = nil)
puts "################ stored location" + (session[:return_to] || " nil")
    session[:return_to] = location || request.request_uri 
puts "######### storing location" + session[:return_to]
  end

  def redirect_back_or_default(default)
puts "######### redirecting to location " + session[:return_to]
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
