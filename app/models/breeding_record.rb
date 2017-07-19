class BreedingRecord < ApplicationRecord
	validates :date, presence: true, uniqueness: true

	scope :get_span, -> (start_day, end_day){ 
		s_day = start_day.strftime("%Y-%m-%d")
		e_day = end_day.strftime("%Y-%m-%d")
		where("date >= \"#{s_day}\" AND date <= \"#{e_day}\"") 
	}
end
