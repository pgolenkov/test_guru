Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: [:index, :show]
    end
  end
end
