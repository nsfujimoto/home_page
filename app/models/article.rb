class Article < ApplicationRecord
	belongs_to :category
	belongs_to :user
	alias_attribute :author, :user


	validates :title, presence: true, length: { maximum: 200 }
	validates :body, presence: true, length: { maximum: 20000 }
	validates :user_id, presence: true
	validate :check_status
	
	scope :user, -> (current_user) { where("user_id = #{current_user.id}")}
	scope :new_articles, -> { find_by_sql(['select * from articles order by created_at desc limit 5']) }

	private
	def check_status
		valid_status = ["published", "draft", "private"]
		unless valid_status.include? status
			errors.add(:status, "不正な文字列です")
		end
	end

end