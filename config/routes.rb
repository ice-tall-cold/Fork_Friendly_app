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
  
  get 'health_concerns/concerns' => 'health_concerns#concerns'
  post 'health_concerns/concerns' => 'health_concerns#create'

  get 'product_line' => 'health_concerns#product_line'
  get 'product_category' => 'health_concerns#product_category'
  get 'company' => 'health_concerns#company'
  get 'cart'  => 'health_concerns#update_cart'
  get 'final_cart' => 'health_concerns#final_cart'
  get 'return' => 'health_concerns#continue'
  get 'modify_cart' => 'health_concerns#modify_cart'

end
