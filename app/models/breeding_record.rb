# == Schema Information
#
# Table name: breeding_records
#
#  id         :integer          not null, primary key
#  feed       :string
#  weight     :integer
#  height     :integer
#  is_shed    :boolean
#  note       :text
#  photo_url  :string
#  date       :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BreedingRecord < ApplicationRecord
	validates :date, presence: true, uniqueness: true

	scope :get_span, -> (start_day, end_day){ 
		s_day = start_day.strftime("%Y-%m-%d")
		e_day = end_day.strftime("%Y-%m-%d")
		where("date >= \"#{s_day}\" AND date <= \"#{e_day}\"") 
	}
end
