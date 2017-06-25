class UserChangeNameNickName < ActiveRecord::Migration[5.0]
  def change
		add_index :users, :name, :unique => true
		add_column :users, :nick_name, :string
		change_column :users, :nick_name, :string, null: false
  end
end
