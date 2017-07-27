tables = %w(user article photo breeding_record) if Rails.env == "development"
tables = %w(user category) if Rails.env == "production"

p "start create seed data"
tables.each do |table|
	path = Rails.root.join("db/seeds", Rails.env, table + ".rb")
	if File.exist?(path)
		puts "Creating #{table}..."
		require path
	else
		p "#{path} is not exist "
	end
end