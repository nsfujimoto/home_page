detail = "テストの詳細です"
sub_detail = "テストの短縮詳細です"
names = ["taro", "jiro", "テスト", "akira", "久保"]
place = ["U.S.", "日本", "広島", "愛媛", "東京"]
password = "password"

0.upto(20) do |n|
	user = User.create(
		name: "taro#{n}",
		detail: detail,
		profile: sub_detail,
		place: place[n % 5],
		email: names[n % 5] + "@example.com",
		nick_name: names[n % 5],
		password: "password",
		password_confirmation: "password",
		administrator: n % 3 == 0 ? true : false
	)
	
	path = Rails.root.join("db/seeds/development", "#{n % 3 + 1}.jpg")
	file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
	
	UserImage.create(
		user: user,
		uploaded_image: file
	)
end