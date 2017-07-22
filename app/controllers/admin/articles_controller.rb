class Admin::ArticlesController < Admin::Base
	before_action :check_author, only: [:edit, :update, :destroy]

	def index
		if current_user.administrator
			@published_articles = Article.published.page(params[:published_page]).per(20)
			@private_articles = Article.private_articles.page(params[:private_page]).per(10)
			@draft_articles = Article.draft.page(params[:draft_page]).per(10)
		else
			@published_articles = Article.all.user(current_user).published.page(params[:published_page]).per(20)
			@private_articles = Article.user(current_user).private_articles.page(params[:privat_page]).per(10)
			@draft_articles = Article.user(current_user).draft.page(params[:draft_page]).per(10)
		end
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
			redirect_to [:admin, @article], notice:"ブログを更新しました"
		else
			render "edit"
		end
	end

	def create
		@article = Article.new
		@article.assign_attributes(article_params)
		@article.author = current_user

		if @article.save
			redirect_to [:admin, @article], notice:"ブログを作成しました"
		else
			render "new"
		end
	end

	def destroy
		Article.find(params[:id]).destroy
		redirect_to :admin_articles
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
