Rails.application.routes.draw do

	root "top#index"
	resources :articles, only: [:index, :show]
	resources :users, only: [:index, :show]
	resources :photos, only: [:index, :show]
	resources :categories, only:[:index, :show]
	resources :breeding_records, only:[:index, :show]
	get "breeding_records/:year/:month" => "breeding_records#index"
	
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
		resources :breeding_records
		get "breeding_records/:year/:month" => "breeding_records#index"

	end
end
