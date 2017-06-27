class PhotosController < ApplicationController
	before_action :login_required, except: [:show]

  def index
		if current_user.administrator
			@photos = Photo.all
		else
			@photos = Photo.users(current_user)
		end
  end

  def show
		@photo = Photo.find(params[:id])
		if params[:format].in?(["jpg", "png", "gif"])
			send_data @photo.data, type: "image/jpeg", disposition: "inline"
		else
		end
  end

  def new		
    @photo = Photo.new
  end

  def edit
		@photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new
		@photo.assign_attributes(photo_params)
		@photo.user = current_user
		
    if @photo.save
			redirect_to @photo, notice: 'Photo was successfully created.' 
    else
			render :new
    end
  end

  def update
		@photo = Photo.find(params[:id])
		@photo.assign_attributes(photo_params)

		if @photo.save
			redirect_to @photo, notice: "更新しました"
		else
			render :edit
		end
  end

  def destroy
		@photo = Photo.find(params[:id])
		if @photo.destroy
			redirect_to photos_path, notice: "削除しました" 
		else
			redirect_to photos_path, notice: "削除に失敗しました"
		end
  end

  private
	def photo_params
		allow = [:name, :uploaded_image]
		param = params.require(:photo).permit(allow)
		param
	end

	def send_image
		send_data @photo.data, type: "image/jpeg", disposition: "inline"
	end

end
