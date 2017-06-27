class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
	helper_method :current_user
	
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def login_required
		redirect_to login_path unless current_user
	end

	def admin_required
		unless current_user
			redirect_to login_path
		else
			redirect_to :root, notice: "権限がありません" unless current_user.administrator
		end
	end
end
