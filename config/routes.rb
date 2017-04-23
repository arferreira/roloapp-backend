Rails.application.routes.draw do
  
  namespace :backend do
    resources :sub_categories, except: [:show, :destroy]
    resources :categories, except: [:show, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins

  get 'dashboard/index'

  root "dashboard#index"

end
