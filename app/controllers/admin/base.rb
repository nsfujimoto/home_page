class Admin::Base < ApplicationController
	layout 'manage'
	before_action :login_required
end