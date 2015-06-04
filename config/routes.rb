Storifire::Application.routes.draw do
  devise_for :users
  resources :steps
  resources :stories
  resources :roles
  resources :projects
  match 'stories/image/:id' => 'stories#yumlimg', :as => :yumlimg, via: [:get]
  match 'stories/role/:role' => 'stories#showRole', :as => :yumlroles, via: [:get]
  match 'stories/steps/:id' => 'stories#steps', :as => :steps_of, via: [:get]
  match 'stories/savetofile/' => 'stories#savetofile', :as => :savetofile, via: [:post]
  match 'roles/map/' => 'roles#map', :as => :roles_map, via: [:get]
  root :to => 'projects#index'
end
