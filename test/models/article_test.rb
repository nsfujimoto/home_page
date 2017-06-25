require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "title test" do
		assert create_article.valid?, "test_title is invalid"
		assert create_article( title: nil ).invalid?, "title is nil"
		assert create_article( title: "a" * 200 ).valid?, "title's wrod is 200"
		assert create_article( title: "a" * 201 ).invalid? "title's word is orver 200"
	end

	test "body test" do
		assert create_article.valid?, "test_body is invalid"
		assert create_article( body: nil ).invalid?, "body is nil"
		assert create_article( body: "a" * 20000 ).valid? "body's word is 20000"
		assert create_article( body: "a" * 20001 ).invalid? "body's word is 200001"
	end

	test "status test" do
		assert create_article( status: "test" ).invalid?, "status: test is invalid"
	end


	private
	def create_article( title: "test_title", body: "test_body", status: "draft" )
		Article.new( title: title, body: body, status: status, category: Category.last )
	end
end
