Rails.application.routes.draw do
  
  get 'static_pages/home'

   get 'static_pages/help'

  get 'errors/not_found'
  get 'errors/internal_server_error'
  
  get 'grocery/concerns' => 'chows#concerns'
  post 'grocery/index' => 'chows#index'
  
  delete 'users/new_list' => 'users#new_shopping_list'

  get 'chows/new'
  get 'chows/index'
  # post 'chows/list'
  get 'chows/:category/sub' => 'chows#return_subs'
  get 'chows/:cat/:sub/food' => 'chows#return_chows'
  post 'chows/:food/add' => 'chows#add_to_shoping_list'
  
  get 'meals/concerns' => 'meals#concerns'
  post 'meals/index' => 'meals#index'
  get 'meals/index'
  
  get 'meals/:tab' => 'meals#return_meals', :constraints => { :tab => /\d+/ }
  #regex says: "the string must ONLY contain (routs.rb has an implied ^$) a digit (\d), there may be multiple digits (+)"
  
  get 'restaurants/index' => 'restaurants#index'
  get 'restaurants/index2' => 'restaurants#index2'
  get 'restaurants/new_menu_items'
  get 'restaurants/new_orders'
  post 'restaurants/new_menu_items' => 'restaurants#menu_item_import'
  post 'restaurants/new_orders' => 'restaurants#order_import'
  get 'restaurants/sponsor'
  
  root 'static_pages#home'
  get 'static_pages/help'
  
  get 'signup' => 'users#new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  
  get 'about-fork-friendly' => 'static_pages#about_FF'
  get 'about-our-app' => 'static_pages#about_our_app'
  get 'about-us' => 'static_pages#about_us'
  get 'contact-us' => 'static_pages#contact_us'
  get 'shop' => 'static_pages#transition'
  
  
  get 'chows/list' => 'chows#list'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  
  get 'menu' => 'menu#new'
  resources :menu
  
  resources :chows do
    collection { post :import }
  end
  
  resources :meals do
    collection { post :import }
  end
  
  resources :orders do
    collection { post :import }
  end
  
  resources :menu_items do
    collection { post :import }
  end
  
end
  