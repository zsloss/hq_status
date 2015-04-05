Rails.application.routes.draw do
  resources :tasks, only: [:index, :edit, :create, :update, :destroy]  
end
