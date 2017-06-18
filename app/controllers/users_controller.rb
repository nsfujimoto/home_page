class UsersController < ApplicationController
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
		@user.build_image
	end

	def create
		@user = User.new
		@user.assign_attributes(user_params)
		
		if @user.save
			redirect_to @user
		else
			render "new"
		end
	end

	def update
		logger.debug user_params[:image]
		logger.debug "test"
		@user = User.find(params[:id])
		@user.assign_attributes(user_params)

		if @user.save
			redirect_to @user
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
		allows = [:name, :detail, :profile, :place, :email, :hashed_password]
		allows << {image_attributes: [:uploaded_image]}
		params.require(:user).permit(allows)
	end

	def send_image
		logger.debug @user.image.file_type
		send_data @user.image.image, type: @user.image.file_type , disposition: "inline"
	end
end
