class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		p params[:article]
		@article.assign_attributes(article_params)

		if @article.save
			redirect_to @article, notice:"ブログを更新しました"
		else
			render "edit"
		end
	end

	def create
		@article = Article.new
		@article.assign_attributes(article_params)

		if @article.save
			redirect_to @article, notice:"ブログを作成しました"
		else
			render "new"
		end
	end

	def destroy
		Article.find(params[:id]).destroy
		redirect_to :articles
	end

	private
	def article_params
		allows = [:title, :body, :status, :content]
		params.require(:article).permit(allows)
	end
	
end
