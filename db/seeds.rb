tables = %w(user article photo breeding_record)

p "start create seed data"
tables.each do |table|
	path = Rails.root.join("db/seeds", "development", table + ".rb")
	if File.exist?(path)
		puts "Creating #{table}..."
		require path
	else
		p "#{path} is not exist "
	end
end