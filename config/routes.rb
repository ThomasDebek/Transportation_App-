Rails.application.routes.draw do
  resources :stops, only: [:index, :show]
  resources :lines, only: [:index, :show]
end
