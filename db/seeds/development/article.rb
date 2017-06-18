1.upto(10) do |n|
	article = Article.new
	article.title = "test_#{n}"
	article.body = "test_body_#{n}" * n
	article.status = ["published", "draft", "private"][n % 3]
	article.content = "test_content" if n % 3 == 1
	if article.save
	else
		p "#{n} error create"
	end
end