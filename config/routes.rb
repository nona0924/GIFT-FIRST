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
  resources :boards, :only => [:show, :index, :new, :create, :edit, :update, :destroy] 
  get "evaluations/new/:id" => "evaluations#new"
  resources :evaluations, :only => [:create]
#   resources :likes, :only => [:create, :destroy]
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
 
  
  root 'home#top'
end
