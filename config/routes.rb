Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'users/:id', to: "users#show", as: :user_account

  resources :desks do
    resources :booking_desks, only: [ :new, :create ]
  end
  resources :booking_desks, only: [ :show, :destroy ]
end
