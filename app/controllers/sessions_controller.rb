class SessionsController < ApplicationController

def new
	redirect_to :root if current_user
end

def create
	id = params[:login][:id]
	password = params[:login][:password]

	user = User.find_by(name: id)
	if user && user.authenticate(password)
		session[:user_id] = user.id
		redirect_to :root
	else
		redirect_to :login, notice: "ユーザーかパスワードが違います"
	end
end

def destroy
	session.delete(:user_id)
	redirect_to :root
end

end
