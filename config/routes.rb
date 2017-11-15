Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'episodes#index'

  resources :scenes, only: [:index]
  
  resources :episodes do
    resources :scenes, shallow: true
  end

  resources :plotlines, only: [:show, :index] do
    resources :scenes, shallow: true
  end

end
