Rails.application.routes.draw do
  resources :tests, only: [:index, :show] do
    resources :questions, shallow: true
  end
end
