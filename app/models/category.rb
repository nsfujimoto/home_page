class Category < ApplicationRecord
	has_many :article

	validates :name, presence: true, length: {maximum: 100}
end
