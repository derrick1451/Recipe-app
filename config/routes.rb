Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  resources :recipes, only: [:index, :new, :show, :create, :destroy] do
    resources :recipe_foods, only: [:create, :destroy]
  end

   get '/recipes/my_recipes', to: 'recipes#my_recipes,

end
