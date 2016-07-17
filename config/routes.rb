Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :motherhouse
      resources :agents
      resources :orders
      resources :receiving_agents

      match '/agentaccount/:fromDate/:toDate' => 'agentaccount#index', via: :get
      match '/agentaccount/:id/:fromDate/:toDate' => 'agentaccount#agent_index', via: :get
      get '/agentaccount/:id', to: 'agentaccount#payments'
      post '/agentaccount', to: 'agentaccount#create'
      put '/agentaccount/:id', to: 'agentaccount#update'
      delete '/agentaccount/:id', to: 'agentaccount#nullify'

      get '/motheraccount', to: 'motheraccount#index'
      delete '/motheraccount/:id', to: 'motheraccount#nullify'

      get '/login', to: 'login#index'

    end
  end

  get 'commons/countries', to: 'commons#get_countries'
  get 'commons/currencies', to: 'commons#get_currencies'
end
