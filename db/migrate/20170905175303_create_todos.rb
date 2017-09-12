class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :memo
      t.date :end_day
			

      t.timestamps
    end
  end
end
