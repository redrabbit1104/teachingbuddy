Rails.application.routes.draw do
  root to: "boards#index" 
  resources :sdates
  resources :boards
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
    # member do
    #   post '/', to: 'rooms#add', as: 'add'
    #   get '/messages/', to: 'messages#index', as: 'message'
    # end
  end
  # get 'rooms/:target_id', to: 'rooms#new', as: 'new_room' 
  # get 'rooms/:target_id/messages/', to 'messages#index'
  
  resources :schedules do
    resources :checks, only: [:create,:update]
    member do
      get 'preview'
      post '/users/:user_id', to: 'confirms#switch'
      patch '/users/:user_id', to: 'confirms#switch'
      get 'next_preview'
      post '/next_users/:user_id', to: 'confirms#next_switch'
      patch '/next_users/:user_id', to: 'confirms#next_switch'
    end
  end

  resources :nextschedules
  resources :confirmedschedules
 
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'registrations/admins'
  get 'registrations/users'

end
