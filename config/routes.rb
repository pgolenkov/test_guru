Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: [:index, :show]
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end
end
