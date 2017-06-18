require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "index" do
		get :index
		assert_response :success
	end

	test "show" do
		id = Article.order(:id).first.id
		get :show, params: {id: id}
		assert_response :success
		assert assigns(:article).present?
	end

	test "new" do
		get :new
		assert_response :success
		assert assigns(:article).present?
	end

	test "edit" do
		id = Article.order(:id).first.id
		get :edit, params: {id: id}
		assert_response :success
		assert assigns(:article).present?
	end

	test "create" do
		post :create, params: { article: { title: "test_title", content: "test_content", body: "test_body" }}
		article = Article.order(:id).last
		assert_response :redirect
		assert_redirected_to article
	end	


	test "destroy success test" do
		id = Article.order(:id).first.id
		assert_difference 'Article.count', -1 do
			delete :destroy, params: { id: id }
		end
	end

end