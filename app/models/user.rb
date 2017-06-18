class User < ApplicationRecord
	has_one :image, class_name: "UserImage", inverse_of: :user, dependent: :destroy
	accepts_nested_attributes_for :image

	validates :name, presence: true, length: { maximum: 100}
	validates :detail, length: {maximum: 4000}
	validates :profile, length: {maximum: 400}
	validates :place, length: {maximum: 100}
	validates :hashed_password, presence: true
end
