1.upto(3) do |n|
	Category.create(name: "test#{n}")
end

users = []
1.upto(3) do |n|
user = User.create(
	name: "article_creater#{n}",
	nick_name: "article_creater#{n}",
	password: "password",
	password_confirmation: "password"
)
users << user
end

1.upto(10) do |n|
	article = Article.new
	article.title = "test_#{n}"
	article.body = "test_body_#{n}" * n
	article.status = ["published", "draft", "private"][n % 3]
	article.content = "test_content"
	article.category = Category.find(n % 3 + 1)
	article.user_id = users[n % 3].id
	if article.save
	else
		p "#{n} error create"
	end
end