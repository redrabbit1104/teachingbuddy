Rails.application.routes.draw do
  root to: "boards#index" 
  resources :sdates
  resources :boards
  resources :schedules do
    resources :checks, only: :create
  end
  resources :nextschedules
 

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
