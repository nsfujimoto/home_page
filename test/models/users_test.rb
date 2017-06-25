require 'test_helper'

class UsersTest < ActiveSupport::TestCase
  test "validate name" do
		user = make_user(name: nil)
		assert user.invalid?
		user.name = "a" * 100
		assert user.valid?
		user.name = "a" * 101
		assert user.invalid?
	end

	test "validate detail" do
		user = make_user(detail: "a" * 4000)
		assert user.valid?
		user = make_user(detail: "a" * 4001)
		assert user.invalid?
	end

	test "validate profile" do
		user = make_user(profile: "a" * 400)
		assert user.valid?
		user = make_user(profile: "a" * 401)
		assert user.invalid?
	end

	test "validate place" do
		user = make_user(place: "a" * 100)
		assert user.valid?
		user = make_user(place: "a" * 101)
		assert user.invalid?
	end

	test "validate hashedpassword" do
		user = make_user(hashed_password: nil)
		assert user.invalid?
	end


	private
	def make_user(name: "test_name", detail: "test_detail", profile: "test_profile",
								place:"test_place", email: "test@example.com", hashed_password: "password", nick_name: "nick_name")
		User.new(
			name: name,
			detail: detail,
			profile: profile,
			place: place,
			email: email,
			hashed_password: hashed_password,
			nick_name: nick_name
		)
	end
end