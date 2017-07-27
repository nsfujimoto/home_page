class Admin::UsersController < Admin::Base
	before_action :check_authority, only: [:edit, :update, :destroy]
	before_action :admin_required, only: [ :new, :create] 

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		if params[:format].in? ["jpg", "gif", "png"]
			send_image
		else
		end
	end

	def new
		@user = User.new
		@user.build_image
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new
		@user.assign_attributes(user_params)
		
		if @user.save
			redirect_to [:admin, @user]
		else
			@user.build_image
			render "new"
		end
	end

	def update
		logger.debug user_params[:image]
		logger.debug "test"
		@user = User.find(params[:id])
		@user.assign_attributes(user_params)

		if @user.save
			redirect_to [:admin, @user]
		else
			render "edit"
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to :users
	end

	private
	def user_params
		logger.debug params
		allows = [:name, :detail, :profile, :place, :email, :nick_name, :password, :password_confirmation]
		allows << {image_attributes: [:uploaded_image]}
		params.require(:user).permit(allows)
	end

	def send_image
		logger.debug @user.image.file_type
		send_data @user.image.image, type: @user.image.file_type , disposition: "inline"
	end

	def check_authority
		user = User.find_by(id: params[:id])
		redirect_to :root, notice: "権限がありません" unless current_user.administrator || current_user == user
	end
end
