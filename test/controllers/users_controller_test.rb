require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	fixtures :users
	form_num = 6
	
	test "index exist users" do
		get :index
		assert_response :success
		assert_select "div#user", User.count
	end
	
	test "index no users" do
		User.all.delete_all
		get :index
		assert_response :success
		assert_select "h1", "ユーザー情報はありません。"
	end
	
	test "show test" do
		user = make_user
		get :show, params: {id: user.id}
		assert_response :success
		assert_select "td", 5
		assert_select "a", /編集/
	end

	test "new test" do
		get :new
		assert_response :success
		assert_select "td", form_num
	end

	test "create success test" do
		count = User.count
		post :create, params: { user: {name: "test_name", detail: "test_detail", profile: "test_profile",
																	place: "test_place", hashed_password: "test_password" } }
		assert_response :redirect
		assert_equal User.count, count + 1
	end

	test "create failed test" do
		count = User.count
		post :create, params: { user: {name: nil, detail: "test_detail", profile: "test_profile", 
																	place: "test_place", hashed_password: nil }}
		assert_response :success
		assert_template "new"
		assert_equal User.count, count
	end

	test "edit test" do
		user = make_user
		get :edit, params: {id: user.id}
		assert_response :success
		assert_select "td", form_num
	end

	test "update success test" do
		user = make_user
		before_name = user.name
		put :update, params: {id: user.id, user: {name: "update_test_name", detail: "test_detail", profile: "test_profile",
																	place: "test_place", hashed_password: "test_password" } }
		assert_response :redirect
		assert User.find(user.id).name != before_name
	end

	test "update failed test" do
		user = make_user
		before_name = user.name
		put :update, params: {id: user.id, user: {name: nil, detail: "test_detail", profile: "test_profile",
																	place: "test_place", hashed_password: "test_password" } }
		assert_response :success
		assert_template "edit"
		assert User.find(user.id).name == before_name
	end

	test "destroy success test" do
		user = make_user
		assert_difference 'User.count', -1 do
			delete :destroy, params: { id: user }
		end
	end
	
	private
	def make_user(name: "test_name", detail: "test_detail", profile: "test_profile",
								place: "test_place", email: "test@example.co.jp", hashed_password: "password")
		user = User.create(
			name: name,
			detail: detail,
			profile: profile,
			place: place,
			email: email,
			hashed_password: hashed_password)
		user
	end
end
