class User < ActiveRecord::Migration[5.0]
  def change
		change_column_null :users, :name, false
		change_column_null :users, :hashed_password, false
  end
end
