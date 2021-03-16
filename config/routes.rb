Rails
  .application
  .routes
  .draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }

    namespace :api, defaults: { format: :json } do
      get '/profile', to: 'profile#show'
    end

    namespace :stripe do
      resources :onetimepayments, only: [:new, :create]
      get 'onetimepayment/success', to: 'onetimepayments#success', as: 'onetimepayments_success'
      get 'onetimepayment/cancel', to: 'onetimepayments#cancel', as: 'onetimepayments_cancel'
    end
  end
