Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :motherhouse
      resources :agents
      resources :orders
      resources :receiving_agents

      get '/agentaccount/:fromDate/:toDate', to: 'agentaccount#index'
      get '/agentaccount/:id/:fromDate/:toDate', to: 'agentaccount#agent_index'
      get '/agentaccount/:id/:id/:id/:id', to: 'agentaccount#payments'
      get '/agentaccount/:id', to: 'agentaccount#show'
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
