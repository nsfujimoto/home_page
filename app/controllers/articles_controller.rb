class ArticlesController < ApplicationController
	before_action :login_required, only: [:new, :edit, :update, :create, :destroy]
	before_action :check_author, only: [:edit, :update, :destroy]

	def index
		@articles = Article.order("created_at desc").published.page(params[:page])
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	def check_author
		article = Article.find_by(id: params[:id])
		redirect_to :back, notice: "アクセス権限がありません" unless article.author == current_user || current_user.administrator
	end
end
