Rails.application.routes.draw do
  get 'sidekicks/index'
  get 'sidekicks/show'
  get 'sidekicks/new'
  get 'sidekicks/edit'
  devise_for :users
  root "projects#index"

  resources :projects
end
