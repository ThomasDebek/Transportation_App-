Rails.application.routes.draw do
  root "stops#index" # Strona główna aplikacji

  resources :stops, only: [:index, :show] do
    member do
      get :lines # Wyświetla linie obsługujące dany przystanek
    end
  end

  resources :lines, only: [:index, :show] do
    member do
      get :stops # Wyświetla przystanki na trasie danej linii
    end
  end

  resources :schedules, only: [:index] # Wyświetla wszystkie rozkłady jazdy (opcjonalne)

  # Obsługa błędnych tras
  get "*path", to: "stops#index", constraints: ->(req) { req.path.exclude? "rails/active_storage" }
end
