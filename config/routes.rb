Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"



  # ADMIN TASKS
  post '/place/add',                controller: :place, action: :add
  post '/gallery/add',              controller: :gallery, action: :add
  post '/route/add',                controller: :route, action: :add
  post '/shop/add',                 controller: :shop, action: :add

  get '/cities',                    controller: :city, action: :list_actives
  get '/place-full/:id',            controller: :place, action: :show_place_full
  get '/places/city/:id',           controller: :place, action: :list_places_actives_from_city
  get '/gallery/:id',               controller: :gallery, action: :gallery_info
  get '/gallery/place/:id',         controller: :gallery, action: :list_galleries_from_place
  get '/route/place/:id',           controller: :route, action: :list_routes_from_place

  # USERS
  post '/user/login',               controller: :user, action: :login


  # UTILS
  # categories
  get '/category/search',           controller: :category, action: :search
  get '/category/list',             controller: :category, action: :list




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
