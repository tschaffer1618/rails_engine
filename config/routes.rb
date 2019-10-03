Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
      end

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
      end

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
      end

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
      end

      namespace :transactions do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
      end

      resources :customers, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
