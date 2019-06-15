Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :rooms do
    resources :booking_rooms, only: [ :new, :create ]
  end
  resources :booking_rooms, only: [ :show, :destroy ]

  get 'users/:id', to: "users#show", as: :user_account

  resources :desks do
    resources :booking_desks, only: [ :new, :create ]
  end
  resources :booking_desks, only: [ :show, :destroy ]

  # get "events"

  resources :events, only: [:new, :show, :create, :index]
end
