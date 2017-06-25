class AddUseidToArticle < ActiveRecord::Migration[5.0]
  def change
		add_reference :articles, :user, index: true
  end
end
