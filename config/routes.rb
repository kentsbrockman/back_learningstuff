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
      resources :subscriptions, only: [:index, :create]
      resources :avatars, only: [:create]
    end

    get '/profile', to: 'users#show'
    put '/profile', to: 'users#update'

    resources :learning_paths, only: %i[index show]
    resources :categories, only: %i[index show]

    namespace :stripe do
      resources :one_time_payments, only: %i[create]
      get 'one_time_payment/success',
          to: 'one_time_payments#success',
          as: 'one_time_payments_success'
      get 'one_time_payment/cancel',
          to: 'one_time_payments#cancel',
          as: 'one_time_payments_cancel'
    end

    namespace :admin do
      resources :users, only: %i[index update destroy]
      resources :learning_paths
      resources :courses, only: %i[index destroy create]
    end

    resources :courses, only: %i[index show] do
      resources :chapters, only: %i[index show] do
        resources :lessons, only: %i[index show] do
          resources :questions, only: %i[index show]
          post '/results', to: 'progress_lessons#create'

          resources :comments
        end
      end
    end
  end
