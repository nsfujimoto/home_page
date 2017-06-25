require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
	def setup
	end

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
		assert_select "select", 2
		assert_select "option", 6
	end

	test "create" do
		assert_difference "Article.count" do
			post :create, params: { article: { title: "test_title", content: "test_content", body: "test_body", category_id: "1" }}
		end
		assert_response :redirect
		assert_redirected_to Article.last
	end	

	test "update" do
		assert_no_difference "Article.count" do
			patch :update, params: { id: 1, article: { title: "test_title", content: "test_content", body: "test_body", category_id: "1" }}
		end
		assert_response :redirect
		assert_redirected_to Article.find(1)
	end

	test "destroy success test" do
		id = Article.order(:id).first.id
		assert_difference 'Article.count', -1 do
			delete :destroy, params: { id: id }
		end
	end

end