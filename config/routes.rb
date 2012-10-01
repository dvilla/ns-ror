NsRor::Application.routes.draw do
  get "admin/index"
  devise_for :admins, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  get "home/index"

  root to: "home#index"

  mount NsLibrary::Engine => '/library'

  namespace :admin do
  end
end
