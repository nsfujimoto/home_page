class Admin::UsersController < Admin::Base
	def index
		@users = User.all
	end

end
