class PhotosController < ApplicationController
  def index
		@photos = Photo.order("created_at desc").page(params[:page]).per(20)
  end

  def show
		@photo = Photo.find(params[:id])
		if params[:format].in?(["jpg", "png", "gif"])
			send_data @photo.data, type: "image/jpeg", disposition: "inline"
		else
		end
  end
  private
	def send_image
		send_data @photo.data, type: "image/jpeg", disposition: "inline"
	end

end
