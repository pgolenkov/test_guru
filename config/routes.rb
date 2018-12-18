Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :index
  end
end
