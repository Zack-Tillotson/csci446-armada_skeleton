ActionController::Routing::Routes.draw do |map|

	map.root :controller => "harvesters", :action => "index"
	map.logout 'logout', :controller => "user_sessions", :action => "destroy"
	map.login 'login', :controller => "user_sessions", :action => "new"
	map.resources :user_sessions, :only => [:new, :create, :destroy]
	map.resources :password_resets, :only => [:new, :create, :edit, :update]
	map.resources :harvesters, :only => [:index, :show]
  
	map.register 'register', :controller => 'users', :action => 'new'

	map.namespace :admin do |admin|
		admin.resources :roles
		admin.resources :users
		admin.resources :harvesters
		admin.root :controller => 'harvesters', :action => 'index'
	end

	map.namespace :members do |members|
		members.resources :users, :only => [:show, :edit, :update]
		members.root :controller => 'harvesters', :action => 'index'
		members.resources :harvesters
	end

end
