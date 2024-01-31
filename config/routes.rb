Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  get 'customers/information/edit' => 'customers#edit'
  get 'customers' => 'customers#show'
  resources :items, only: [:index, :show]
  resources :orders, only: [:new, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
