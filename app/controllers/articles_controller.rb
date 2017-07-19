class ArticlesController < ApplicationController
	before_action :login_required, only: [:new, :edit, :update, :create, :destroy]
	before_action :check_author, only: [:edit, :update, :destroy]

	def index
		@articles = Article.all.page(params[:page])
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		logger.debug "test_log"
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
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
		@article.author = current_user

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
		allows = [:title, :body, :status, :content, :category_id]
		params.require(:article).permit(allows)
	end
	

	def check_author
		article = Article.find_by(id: params[:id])
		redirect_to :back, notice: "アクセス権限がありません" unless article.author == current_user || current_user.administrator
	end
end
