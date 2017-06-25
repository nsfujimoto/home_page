class Category < ApplicationRecord
	has_many :article

	validates :name, presence: true, length: {maximum: 100}

	class << self
		def get_hash
			categories_hash = {}
			Category.all.each do |category|
				categories_hash.store(category.name, category.id)
			end
			categories_hash
		end
	end
end
