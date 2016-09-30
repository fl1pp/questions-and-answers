Rails.application.routes.draw do
	resources :sessions, only: [:new, :create, :destroy]
	get '/log_in', to: 'sessions#new', as: :log_in
	delete '/log_out', to: 'sessions#destroy', as: :log_out
	
	resources :users, only: [:new, :create] do
	  member do
	    get :activate
	  end
	  resources :reset_passwords, only: [:new, :create, :update, :edit]
	end
	get '/sign_up', to: 'users#new', as: :sign_up
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
