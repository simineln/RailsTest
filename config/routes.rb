Rails.application.routes.draw do
  get 'clients/new'
  get 'clients/show'
  get 'clients/destroy'
  get 'clients/edit'
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations' }


  get 'libraries/new'
  get 'libraries/edit'
  get 'libraries/destroy'
  get 'libraries/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/libraries' => "libraries#index", :as => :user_root

  resources :libraries, :clients

  root to: 'libraries#index'
end
