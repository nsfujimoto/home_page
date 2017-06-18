class RenameType < ActiveRecord::Migration[5.0]
  def change
		rename_column :photos, :type, :file_type
  end
end
