Rails.application.routes.draw do
  namespace :api do
  namespace :v1 do
    get 'ip_addresses/index'
    end
  end

  get 'ip_addresses/index'

  root to: 'site#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ip_addresses, only: [:index, :show, :create, :update, :delete]
    end
  end
end
