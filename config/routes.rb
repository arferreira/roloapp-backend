Rails.application.routes.draw do
  get 'dashboard/index'

  get "log_out", to: "sessions#destroy"
  get "log_in" => "sessions#new"
  get "sign_up" => "admins#new"
  get 'sessions/new'



  root "sessions#new"

  resources :admins
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
