Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check

  root "blog_posts#index"

  resources :blog_posts do
    resources :comments, only: [:create, :destroy]
    member do
      post 'like'
      delete 'unlike'
    end
    collection do
      get 'search', as: :search
    end
  end

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "profile", to: "profiles#index"
end
