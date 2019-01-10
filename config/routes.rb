Rails.application.routes.draw do
  get 'faces/register'
  devise_for :users
  get 'memos', :to => 'memos#index', :as => :user_root

  resources :categories


  post 'memos/photo' => 'memos#photo'

  resources :memos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'memos#index'
end
