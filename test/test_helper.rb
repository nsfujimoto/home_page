ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

	def uploaded_file(fname, type)
		Rack::Test::UploadedFile.new(
			Rails.root.join("test/images", fname), type, true)
	end

end
