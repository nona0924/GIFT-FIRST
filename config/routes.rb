Rails.application.routes.draw do
  devise_for :users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts , :only => [:show, :index, :new, :create, :edit, :update, :destroy] 
  resources :home, :only => [:top]
  resources :users, :only => [:show, :index]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index, :edit, :update]
  
  root 'home#top'
end
