Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "foods#index"
  resources :foods,only: [:index, :show, :create, :new]
  resources :recipes, only: [:index,:show, :destroy, :create, :new] do
    member do
      patch 'toggle_public'
    end  
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
end
