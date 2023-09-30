Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :foods,only: [:index, :show, :create, :new,:destroy]

  get '/general_shopping_list', to: 'shopping_lists#index', as: 'general_shopping_list'
  
  resources :recipes, only: [:index,:show, :destroy, :create, :new] do
    member do
      patch 'toggle_public'
    end  
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  # get "/public_recipes", to: "recipes#index", as: 'public_recipes'
  resources :public_recipes, only: [:index]
end
