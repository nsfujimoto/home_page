class Admin::AccountsController < Admin::Base
	before_action :check_same_user, only: [:update]

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		user = current_user
		user.assign_attributes(account_params)

		if user.save
			redirect_to :admin_account
		else
			render "edit"
		end
	end

	
	private
	def check_same_user
		redirect_to :admin_account if current_user != User.find_by(id: params[:id])
	end

	def account_params
		allows = [:name, :detail, :place, :email, :hashed_password, :profile, :nick_name]
		allows << :administrator if current_user.administrator
		
		params.require(:user).permit(allows)
	end
end
