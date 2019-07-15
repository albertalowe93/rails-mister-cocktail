Rails.application.routes.draw do
  root to: "cocktails#index"
  delete 'cocktails/:id', to: 'cocktails#destroy', as: 'destroy'
  resources :cocktails, only: [:index, :show, :new, :create, :edit, :update] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
