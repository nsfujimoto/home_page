class SessionsController < ApplicationController

def new
end

def create
	id = params[:login][:id]
	password = params[:login][:password]

	user = User.find_by(name: id)
	if user && user.authenticate(password)
		session[:user_id] = user.id
		redirect_to :root, notice: "id:" + id + ", password:" + password
	else
		redirect_to :login, notice: "ユーザーかパスワードが違います"
	end
	logger.debug user.hashed_password
end

def destroy
	logger.debug "test"
	session.delete(:user_id)
end

end
