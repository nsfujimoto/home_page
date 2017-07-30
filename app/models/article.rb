# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  body        :text             not null
#  content     :text
#  status      :string           default("draft")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

class Article < ApplicationRecord
	belongs_to :category
	belongs_to :user
	alias_attribute :author, :user


	validates :title, presence: true, length: { maximum: 200 }
	validates :body, presence: true, length: { maximum: 20000 }
	validates :user_id, presence: true
	validate :check_status
	
	scope :user, -> ( user ) { where("user_id = #{user.id}")}
	scope :new_articles, -> ( n = 5 ) { limit(n).order("created_at desc") }
	scope :published, -> { where("status = 'published'").order_created }
	scope :private_articles, -> { where("status = 'private'").order_created }
	scope :draft, -> { where("status = 'draft'").order_created }
	scope :order_created, -> { order("created_at desc") }

	def category_name
		if self.category.present?
			self.category.name
		else
			"no_category"
		end
	end

	private
	def check_status
		valid_status = ["published", "draft", "private"]
		unless valid_status.include? status
			errors.add(:status, "不正な文字列です")
		end
	end

end
