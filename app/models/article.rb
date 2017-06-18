class Article < ApplicationRecord
	belongs_to :category

	validates :title, presence: true, length: { maximum: 200 }
	validates :body, presence: true, length: { maximum: 20000 }
	validate :check_status

	private
	def check_status
		valid_status = ["published", "draft", "private"]
		unless valid_status.include? status
			errors.add(:status, "不正な文字列です")
		end
	end

end