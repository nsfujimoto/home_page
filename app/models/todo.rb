class Todo < ApplicationRecord

validates :title, presence: true
validate :check_end_day

attr_accessor :exist_end_day
belongs_to :user
scope :auth_user, -> (user){ where( user: user) }


private
def check_end_day
	self.end_day = nil unless self.exist_end_day
	logger.debug "self.exist_end_day is " + self.exist_end_day.to_s
	logger.debug "self.end_day is " + self.end_day.to_s
end

public
def is_over
	self.exist_end_day ? self.end_day < Date.today : false
end

def exist_end_day=(val)
	@exist_end_day = val.to_i==1 ? true : false
	logger.debug "val is" + val.to_s
	logger.debug "exist end day is" + @exist_end_day.to_s
end

def exist_end_day
	unless @exist_end_day.nil?
		@exist_end_day
	else
		@exist_end_day = self.end_day.present?
	end
end

end
