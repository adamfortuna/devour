Rails.application.routes.draw do

  resources :maps

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
