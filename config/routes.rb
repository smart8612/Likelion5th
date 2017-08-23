Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'home#home_login'
  
  get '/home_logout' => 'home#home_logout'

  #<<mylist start
  get '/mylist/:user_id' => 'mylist#mylist'

  post '/mylist_model' => 'mylist#mylist_model'

  post '/mylist_delete/:mylist_id' => 'mylist#mylist_delete'
  
  post '/myplan_delete/:myplan_id' => 'mylist#myplan_delete'

  post '/myplan_model' => 'mylist#myplan_model'
  
  post '/mylist_complete/:mylist_id' => 'mylist#mylist_complete'
  
  post '/myplan_sub_complete/:myplan_id' => 'mylist#myplan_sub_complete'

  #>>mylist end
  
  get '/profile/:user_id' => 'social#profile'
  
  #<<post_show start
  get '/post_show/:post_id' =>'home#post_show'

  post '/comment_create' => 'comment#comment_create'
  #>>post_show end

  #<<post_update start
  get '/post_update/:post_id' => 'home#post_update'
  
  post '/post_update_a/:post_id' => 'home#post_update_a'
  #>>post_update end
  
  #<<write start
  get '/write' => 'home#write'
  
  post '/create' => 'home#create'
  
  get '/destroy_view/:post_id' => 'home#destroy_view'
  #>>write end
  
  
  get '/feed' => 'home#post_feed'
  
  post '/comment_create' => 'comment#comment_create'
  
  post '/comment/:comment_id' => 'comment#comment_delete'
  
  get '/friends/:user_id' => 'social#friends'
  
  get '/follow/:user_id' => 'social#follow'
  
  get '/unfollow/:user_id' => 'social#unfollow'
  
  get '/profile_intro/:user_id' => 'social#profile_intro'
  
  post '/intro_edit/:user_id' => 'social#intro_edit'
  
  post '/img_edit/:user_id' => 'social#img_edit'
  
  get '/year/:user_id' => 'home#year'
  
  get '/to_year/:user_id/:select_year' => 'home#to_year'
  
  # get '/achievement' => 'application#ajax_json'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
