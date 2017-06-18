module ApplicationHelper

	def create_photo_image_tag(photo, options = {alt: photo.name})
		path = photo_path(photo, format: photo.get_format)
		image_tag(path, options)
	end

	def create_user_image_tag(user, options = {})
		path = user_path(user, format: user.image.get_format)
		image_tag(path, options)
	end
end
