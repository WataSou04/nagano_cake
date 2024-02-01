Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  scope module: :public do
    devise_for :customers
    root to: 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get 'customers' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/check' => 'customers#check'
    patch 'customers/withdrawal' => 'customers#withdrawal'
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
