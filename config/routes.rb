Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  resources :customers, only: [:show, :edit, :update]
  resources :cart_items, only: [:index, :update, :create, :destroy]
  resources :orders, only: [:new, :create, :index, :show]
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
