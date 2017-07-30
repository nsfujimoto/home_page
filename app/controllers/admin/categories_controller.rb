class Admin::CategoriesController < Admin::Base

	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
	end

	def create
		@category = Category.new
		@category.assign_attributes(category_params)
		if @category.save
			redirect_to [:admin, @category], notice: "カテゴリを登録しました"
		else
		end
	end

	def update
		@category = Category.find(params[:id])
		@category.assign_attributes(category_params)

		if @category.save
			redirect_to [:admin, @category]
		else
		end
	end

	def destroy
		@category = Category.find(params[:id])
		if @category.destroy
			redirect_to admin_categories_path, notice: "カテゴリを削除しました"
		else
			redirect_to [:admin, @category], notice: "カテゴリの削除に失敗しました"
		end
	end

	private
	def category_params
		allows = [:name]
		params.require(:category).permit(allows)
	end

end
