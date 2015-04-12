Rails.application.routes.draw do
	resources :tasks, only: [:index, :edit, :create, :update, :destroy]

	resources :users, only: [:new, :index, :edit, :create, :update, :destroy] do
		resources :tasks, only: [:index, :edit, :create, :update, :destroy]
	end
end