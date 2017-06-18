class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
			t.references :user
			t.binary :image
			t.string :file_type
      t.timestamps
    end
  end
end
