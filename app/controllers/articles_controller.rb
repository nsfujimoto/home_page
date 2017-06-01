class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find_by(params[:id])
	end

	def new
		@article = Article.new
	end
	
	def create
	end

	def edit
		@article = Article.find_by(params[:id])
	end

	def update
	end
end
