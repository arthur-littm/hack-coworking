Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rooms do
    resources :booking_rooms, only: [ :new, :create ]
  end
  resources :booking_rooms, only: [ :show, :destroy ]

  patch 'accept', to: "lunches#accept", as: :accept
  patch 'decline', to: "lunches#decline", as: :decline

  get 'users/:id', to: "users#show", as: :user_account

  resources :events, only: [:new, :show, :create, :index]

  resources :desks
  resources :booking_desks, only: [ :show, :destroy, :new, :create, :edit, :update ]
  resources :lunches, only: [ :create, :new, :show, :index ]

  get :admin, to: "users#admin", as: :admin
end
