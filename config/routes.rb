Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts , :only => [:show, :index, :new, :create, :edit, :update, :destroy] 
  resources :home, :only => [:top]
  resources :users, :only => [:show, :index, :edit, :update]
  
  root 'home#top'
end
