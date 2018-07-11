Rails.application.routes.draw do
  resources :genres do
    collection do
      post :choose
    end
  end
  root to: 'genres#index'
end
