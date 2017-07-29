user = User.create(
	name: "admin",
	nick_name: "admin_user",
	password: "password",
	administrator: true
)

path = Rails.root.join("db/seeds/production", "sample.jpg")
file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)

UserImage.create(
	user: user,
	uploaded_image: file
)
