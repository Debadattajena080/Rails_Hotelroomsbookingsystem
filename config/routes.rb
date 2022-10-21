# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Root
  root 'hotels#index'
  get 'hotels/:id/rooms', to: 'hotels#rooms', as: 'hotel_rooms'
  get 'search', to: 'hotels#search'
  get '/bookings/index', to: 'bookings#index', as: 'bookings_index'

  # Definig the routes for the admin
  get 'admins/pending_bookings', to: 'admins#pending_bookings'
  get 'admins/confirmed_bookings', to: 'admins#confirmed_bookings'

  # Defines the route for approving and rejecting bookings
  get 'admins/approve_booking/:id', to: 'admins#approve_booking', as: 'approve_booking'
  get 'admins/reject_booking/:id', to: 'admins#reject_booking', as: 'reject_booking'

  match 'admins/approve_booking/:id', to: 'admins#approve_booking', via: %i[get patch]
  match 'admins/reject_booking/:id', to: 'admins#reject_booking', via: %i[get patch]

  patch 'admins/approve_booking/:id', to: 'admins#approve_booking'
  patch 'admins/reject_booking/:id', to: 'admins#reject_booking'

  # users authentication
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'


  # Resources
  resources :hotels
  resources :roomtypes
  resources :rooms

  #  resources :hotels do
  #     resources :rooms
  #   end

  resources :rooms do
    resources :bookings, only: %i[new create]
  end
end
