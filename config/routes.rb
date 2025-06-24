Rails.application.routes.draw do
  resources :products, only: %i[index show] do
    resources :feedbacks, only: %i[create]
  end

  resources :review_imports, only: %i[create]
end
