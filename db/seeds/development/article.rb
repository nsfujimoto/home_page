1.upto(3) do |n|
	Category.create(name: "test#{n}")
end

1.upto(10) do |n|
	article = Article.new
	article.title = "test_#{n}"
	article.body = "test_body_#{n}" * n
	article.status = ["published", "draft", "private"][n % 3]
	article.content = "test_content" if n % 3 == 1
	article.category = Category.find(n % 3 + 1)
	article.user_id = n % 3 + 1
	if article.save
	else
		p "#{n} error create"
	end
end