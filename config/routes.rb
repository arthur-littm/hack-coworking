Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :rooms do
    resources :booking_rooms, only: [ :new, :create ]
  end
  resources :booking_rooms, only: [ :show, :destroy ]

  resources :desks do
    resources :booking_desks, only: [ :new, :create ]
  end
  resources :booking_desks, only: [ :show, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
