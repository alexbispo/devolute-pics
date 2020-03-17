ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def fixture_file_upload(path)
    Rack::Test::UploadedFile.new(File.join(fixture_path, path))
  end
end

module AuthTokenHelper
  def authenticate(email, password)
    post api_v1_auth_url, params: {email: email, password: password}
    JSON.parse(@response.body)['token']
  end
end

class ActionDispatch::IntegrationTest
  include AuthTokenHelper
end
