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

    resources :users, defaults: { format: :json } do
      resources :avatars, only: [:create]
    end

    get '/profile', to: 'users#show'
    put '/profile', to: 'users#update'

    namespace :stripe do
      resources :one_time_payments, only: %i[new create]
      get 'one_time_payment/success',
          to: 'one_time_payments#success',
          as: 'one_time_payments_success'
      get 'one_time_payment/cancel',
          to: 'one_time_payments#cancel',
          as: 'one_time_payments_cancel'
    end

    namespace :admin do
      resources :users, only: [:index, :update, :destroy]
    end

    resources :courses, only: [:index, :show] do
      resources :chapters, only: [:index, :show] do
        resources :lessons, only: [:index, :show] do
          resources :questions, only: [:index, :show]
            post '/results', to: "progress_lessons#create"

          resources :comments
        end
      end
    end
  end
