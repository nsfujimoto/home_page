users = []
0.upto(3) do |n|
user = User.create(
	name: "photo_creater#{n}",
	nick_name: "photo_creater#{n}",
	password: "password",
	password_confirmation: "password"
)
users << user
end

0.upto(10) do |n|
	path = Rails.root.join("db/seeds/development", "#{n % 3 + 1}.jpg")
	file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
	Photo.create(
		name: "test#{n}",
		uploaded_image: file,
		user_id: users[n % 3].id
	)
end