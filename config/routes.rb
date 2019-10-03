Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#find'
      end

      namespace :invoice_items do
        get '/find', to: 'find#find'
      end

      namespace :invoices do
        get '/find', to: 'find#find'
      end

      namespace :items do
        get '/find', to: 'find#find'
      end

      namespace :merchants do
        get '/find', to: 'find#find'
      end

      namespace :transactions do
        get '/find', to: 'find#find'
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
