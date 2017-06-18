class RmDetailAddProfileInUsers < ActiveRecord::Migration[5.0]
  def change
		change_table :users do |t|
			t.remove :sub_detail
			t.string :profile
		end
  end
end
