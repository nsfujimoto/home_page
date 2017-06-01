require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "index" do
		get :index
		assert_response :success
	end

	test "show" do
		get :show, params: {id: 1}
		assert_response :success
		assert assigns(:article).present?
	end

	test "new" do
		get :new
		assert_response :success
		assert assigns(:article).present?
	end

	test "edit" do
		get :edit, params: {id: 1}
		assert_response :success
		assert assigns(:article).present?
	end
end
