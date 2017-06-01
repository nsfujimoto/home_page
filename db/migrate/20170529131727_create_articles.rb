class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
			t.string :title, null: false				#タイトル
			t.text :body, null: false						#本文
			t.text :content											#見出し文
			t.string :status, default: "draft"	#ステータス(published, draft, private)
      t.timestamps
    end
  end
end
