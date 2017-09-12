Rails.application.routes.draw do

	root "top#index"
	resources :articles, only: [:index, :show]
	resources :users, only: [:index, :show]
	resources :photos, only: [:index, :show]
	resources :categories, only:[:index, :show]
	resources :breeding_records, only:[:index, :show]
	get "breeding_records/:year/:month" => "breeding_records#index"
	
	get "user/create/login" => "sessions#new", as: :login
	post "user/create/login" => "sessions#create"
	delete "logout" => "sessions#destroy"

	#adminネームスペース下のルーティング
	get "admin" => "admin#index"
	namespace :admin do
		resources :articles
		resources :photos
		resources :users
		resources :categories
		resource :account
		resources :breeding_records
		get "breeding_records/:year/:month" => "breeding_records#index"
		resources :todos, except: [:edit]
	end
end
