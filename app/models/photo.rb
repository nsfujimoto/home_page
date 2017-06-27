class Photo < ApplicationRecord
	belongs_to :user

	validates :name, presence: true, length: {maximum: 100}
	validates :uploaded_image, presence: {on: :create }
	validate :check_image

	scope :users, -> (user) { where( "user_id == #{user.id}" ) }

	attr_accessor :uploaded_image

	def uploaded_image=(image)
		self.data = image.read
		self.file_type = convert_type(image.content_type)
		@uploaded_image = image
	end

	def uploaded_image
		@uploaded_image
	end

	IMAGE_TYPES = {
		"image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }
	
	def get_format
		IMAGE_TYPES[file_type]
	end
	

	private
	def check_image
		if @uploaded_image
			if data.size > 64.megabytes
				errors.add(:data, :too_big_image)
			end
		end
		unless IMAGE_TYPES.has_key?(file_type)
			logger.debug file_type
			errors.add(:data, :invalid_image)
		end
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
