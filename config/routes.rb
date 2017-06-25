Rails.application.routes.draw do
  resources :photos
	root "top#index"
	resources :articles
	resources :users
	resources :photos
	resources :categories
	get "login" => "sessions#new"
	post "login" => "sessions#create"
	delete "logout" => "sessions#destroy"
end
