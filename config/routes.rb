Rails.application.routes.draw do
  
  # OPTIMIZE the routes needs to be added so
  # NO LOGIN 
  # / => points to the sign-up/login screen
  # /error

  # LOGIN
  # /dashbord ==> all routes
  # /patiensts ==> all routes
  # Divide the Page Like
  # mount ==> resource ==> individual request
  # Add the 404,internal Server Error


  resources :patients
  root "pages#index"

  mount Flipper::UI.app(Flipper) => "/flipper" if Rails.env.development?

  devise_for :users do
    authenticated :user do
      root :to => 'dashboards#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'session#new', as: :unauthenticated_root
    end
  end

  resources :dashboards, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
