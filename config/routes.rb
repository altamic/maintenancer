ActionController::Routing::Routes.draw do |map|
  map.resources :maintenances
  map.resources :users
  map.resources :equipments
  map.root :maintenances
end
