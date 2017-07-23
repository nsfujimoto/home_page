# == Schema Information
#
# Table name: user_images
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  image      :binary
#  file_type  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserImage < ApplicationRecord
	belongs_to :user, inverse_of: :image

	attr_accessor :uploaded_image

	IMAGE_TYPE = { "image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

	def uploaded_image=(image)
		self.image = image.read
		self.file_type = convert_type(image.content_type)
		@uploaded_image = image
	end

	def get_format
		IMAGE_TYPE[file_type]
	end

	private

	def uploaded_image
		@uploaded_image
	end
	
	def convert_type(ctype)
		ctype = ctype.rstrip.downcase
		case ctype
			when "image/pjpeg" then "image/jpeg"
			when "image/jpg" then "image/jpeg"
			when "image/x-png" then "image/png"
			else ctype
		end
	end

end
