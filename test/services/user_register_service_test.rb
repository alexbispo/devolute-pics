require 'test_helper'

class UserRegisterServiceTest < ActiveSupport::TestCase

  test "#register returns the registered user." do
    user_service = UserRegisterService.new
    user = user_service.register({username: 'tempestade',
                           email: 'tempe@test.com',
                           password: 'mozart!123'})

    assert user.persisted?
  end

  test "#register returns no persisted user instance with errors" do
    user_service = UserRegisterService.new
    user = user_service.register({username: 't',
                           email: 'tempe',
                           password: '123'})

    assert_not user.persisted?
    assert_not user.errors.empty?
  end
end
