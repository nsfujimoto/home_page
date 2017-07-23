# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  detail          :text
#  place           :text
#  email           :string
#  hashed_password :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profile         :string
#  nick_name       :string           not null
#  administrator   :boolean          default(FALSE)
#

class User < ApplicationRecord
	has_one :image, class_name: "UserImage", inverse_of: :user, dependent: :destroy
	accepts_nested_attributes_for :image

	has_many :article, dependent: :destroy
	has_many :photo

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
