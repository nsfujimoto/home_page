class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
			t.string :name, null: false
			t.binary :data, null: false
			t.string :type, null: false
			
      t.timestamps
    end
  end
end
