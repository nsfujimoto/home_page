detail = "テストの詳細です"
sub_detail = "テストの短縮詳細です"
names = ["taro", "jiro", "テスト", "akira", "久保"]
place = ["U.S.", "日本", "広島", "愛媛", "東京"]
password = "password"

0.upto(20) do |n|
	User.create(
		name: names[n % 5],
		detail: detail,
		profile: sub_detail,
		place: place[n % 5],
		email: names[n % 5] + "@example.com",
		hashed_password: password
	)
end