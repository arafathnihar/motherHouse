Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :motherhouse
      resources :agents
      resources :orders
      resources :receiving_agents

      get '/agentaccount', to: 'agentaccount#index'
      post '/agentaccount', to: 'agentaccount#create'
      put '/agentaccount/:id', to: 'agentaccount#update'
      delete '/agentaccount/:id', to: 'agentaccount#nullify'

      get '/motheraccount', to: 'motheraccount#index'
      # post '/motheraccount', to: 'motheraccount#create'
      delete '/motheraccount/:id', to: 'motheraccount#nullify'

      get '/login', to: 'login#index'

    end
  end

  get 'commons/countries', to: 'commons#get_countries'
  get 'commons/currencies', to: 'commons#get_currencies'
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
