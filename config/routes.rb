Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  
  devise_for :customers, skip: [:psswords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
    
  scope module: :public do
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
