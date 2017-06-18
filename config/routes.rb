Rails.application.routes.draw do
  resources :photos
	root "top#index"
	resources :articles
	resources :users
	resources :photos
	resources :categories
end
