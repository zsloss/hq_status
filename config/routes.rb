Rails.application.routes.draw do

	root 'sessions#new'
	get    'login'   => 'sessions#new'
	post   'login'   => 'sessions#create'
	delete 'logout'  => 'sessions#destroy'

	resources :tasks, only: [:index, :edit, :create, :update, :destroy]

	resources :users, only: [:new, :index, :edit, :create, :update, :destroy] do
		resources :tasks, only: [:index, :edit, :create, :update, :destroy]
	end
end