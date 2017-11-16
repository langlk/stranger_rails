Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'episodes#index'
  # Friday Project only use resources/root routes, this is for Authentication stuff (next week)

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  # Stuff from here down is okay
  resources :scenes, only: [:index]
  resources :reviews, only: [:index]

  resources :users, only: [:show]

  resources :episodes do
    resources :scenes, shallow: true
    resources :reviews, shallow: true
  end

  resources :plotlines, only: [:show, :index] do
    resources :scenes, shallow: true
  end

end
