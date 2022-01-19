Rails.application.routes.draw do
  get 'welcome/index'
  root 'articles#index'

  get 'articles/my'
  devise_for :users
 

  resources :articles

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
