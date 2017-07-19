class CreateBreedingRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :breeding_records do |t|
			t.string :feed
			t.integer :weight
			t.integer :height
			t.boolean :is_shed
			t.text :note
			t.string :photo_url
			t.date :date, null: false
      t.timestamps
    end
		add_index :breeding_records, :date, unique: true
  end
end
