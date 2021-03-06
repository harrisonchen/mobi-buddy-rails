Rails.application.routes.draw do
  get 'gas/index'

  devise_for :users, controllers: { sessions: "users/sessions",
                                    registrations: "users/registrations" }

  resources :items

  root 'home#index'

  match 'signup', to: 'users#sign_up', via: 'GET'
  match 'signin', to: 'users#sign_in', via: 'GET'

  match 'search', to: 'gas#search', via: 'GET'
  match 'gas_stations', to: 'gas#index', via: 'GET'
  match 'nearby_gas', to: 'gas#nearbyGas', via: 'GET'
  match 'update_gas', to: 'gas#updateGas', via: 'GET'
  match 'find_gas_by', to: 'gas#findGasBy', via: 'GET'
  match 'get_brands', to: 'gas#getBrands', via: 'GET'
  match 'wishlist', to: 'wishlist#index', via: 'GET'

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
