ActionController::Routing::Routes.draw do |map|
  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.resources :user_sessions
  map.resources :maintenances
  map.resources :users
  map.resources :equipments
  map.root :controller => "users", :action => "index"
end
