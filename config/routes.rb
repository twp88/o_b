Rails.application.routes.draw do
  root to: 'front_page#index'

  resources :article
end
