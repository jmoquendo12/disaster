Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #
  # get "0000" => "calamities#index"
  root "calamities#index"
  resources :calamities, path_names: {new: "0000", edit: "1111"} do
    resources :comments, except: :show
  end
  resources :categories
end
