class User < ApplicationRecord
	has_one :image, class_name: "UserImage", inverse_of: :user, dependent: :destroy
	accepts_nested_attributes_for :image

	has_many :article, dependent: :destroy

	validates :name, presence: true, length: { maximum: 100}
	validates :detail, length: {maximum: 4000}
	validates :profile, length: {maximum: 400}
	validates :place, length: {maximum: 100}
	validates :hashed_password, presence: true
	validates :password, confirmation: true

	attr_accessor :password, :password_confirmation

	def password=(val)
		if val.present?
			self.hashed_password = BCrypt::Password.create(val)
		end
		@password = val
	end
	
	def authenticate( password )
		BCrypt::Password.new(self.hashed_password) == password
	end

end
