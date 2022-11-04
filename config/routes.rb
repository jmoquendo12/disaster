Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "calamities#index"
  resources :calamities do
    resources :comments, except: :show
  end
  resources :categories
end
