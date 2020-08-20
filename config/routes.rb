Rails.application.routes.draw do
  devise_for :users
  root :to => 'root#top'
  get "home/about" => 'root#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
