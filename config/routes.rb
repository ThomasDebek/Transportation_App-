Rails.application.routes.draw do
  get "stops/index"
  get "stops/show"
  resources :stops, only: [:index, :show]
  resources :lines, only: [:index, :show]
end
