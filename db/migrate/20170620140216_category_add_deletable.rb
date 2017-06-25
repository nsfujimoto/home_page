class CategoryAddDeletable < ActiveRecord::Migration[5.0]
  def change
		add_column :categories, :deletable, :boolean, default: true #true is deletable, false is undeletable
  end
end
