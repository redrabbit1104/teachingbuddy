Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'boards/index'
  root to: "boards#index"
end
