Rails.application.routes.draw do
  root to: 'cocktails#index'
  # get 'cocktails/doses'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # GET "cocktails", to: "cocktails#index"
  # GET "cocktails/:id", to: "cocktails#show"
  # GET "cocktails/new", to: "cocktails#new"
  # POST "cocktails", to: "cocktails#create"
  # GET "cocktails/42/doses/new", to: "cocktails#update"
  # POST "cocktails/42/doses", to: "cocktails#edit"
  # DELETE "doses/25", to: "cocktails#destroy"
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:show, :index, :new, :create]
  end

  resources :doses, only: [:destroy]

end
