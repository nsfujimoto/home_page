Rails.application.routes.draw do

	root "top#index"
	resources :articles, only: [:index, :show]
	resources :users, only: [:index, :show]
	resources :photos, only: [:index, :show]
	resources :categories, only:[:index, :show]
	get "login" => "sessions#new"
	post "login" => "sessions#create"
	delete "logout" => "sessions#destroy"
	get "admin" => "admin#index"
	namespace :admin do
		resources :articles
		resources :photos
		resources :users
		resources :categories
		resource :account
	end
end
