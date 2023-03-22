Rails.application.routes.draw do
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"

  get 'search', to: 'searchs#index', as: :search
  get 'search/suggestions', to: 'searchs#suggestion', as: :search_suggestions
end
