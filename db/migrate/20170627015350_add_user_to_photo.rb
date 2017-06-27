class AddUserToPhoto < ActiveRecord::Migration[5.0]
  def change
		add_reference :photos, :user
		change_column :photos, :user_id, :integer, null: false
  end
end
