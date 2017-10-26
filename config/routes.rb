Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  get '/' => 'sessions#home'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  
  delete 'logout' => 'sessions#destroy'

  get 'signup' => 'users#new'
  resources :users
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  get 'product_lines/new'
  resources :product_lines do
    collection { post :import }
  end
  
  get 'health_concerns/new'
  resources :health_concerns do
    collection { post :import }
  end
end
