class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
			t.string :name			#ユーザー名
			t.text :detail			#紹介文
			t.text :sub_detail	#サイドバー用紹介文
			t.text :place				#出身地
			t.string :email			#メールアドレス
			t.string :hashed_password	#ハッシュ済みパスワード
			
      t.timestamps
    end
  end
end
