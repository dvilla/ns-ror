NsRor::Application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}


  get "admin/index"
  devise_for :admins

  get "home/index"

  root to: "home#index"

  #mount NsLibrary::Engine => '/library'


  resources :authors
  resources :books
  resources :publishers

  namespace :admin do
  end
end
