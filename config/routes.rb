Rails.application.routes.draw do
  get 'user/home'
  resources :user
  devise_for :users,  :controllers => { :registrations => "users/registrations" }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
