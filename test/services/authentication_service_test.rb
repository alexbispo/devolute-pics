require 'test_helper'

class AuthenticationServiceTest < ActiveSupport::TestCase

  test "#authenticate returns the user when email and password valid." do
    user = users(:mozart)
    service = AuthenticationService.new

    assert service.authenticate(user.email, 'mozart!123')
  end

  test "#authenticate returns nil when user not found" do
    service = AuthenticationService.new

    assert_not service.authenticate('invalid@test.com', 'invalid123')
  end
end
