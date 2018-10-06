Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :agents
  get 'home/index'
  root 'home#index'
  post 'inbox', :to => 'tickets#inbox', :as => :tickets_index

  resources :tickets do
    member do
      get 'detail'
      post 'reply'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
