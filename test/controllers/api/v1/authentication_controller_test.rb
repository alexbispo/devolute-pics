require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "creates authentication" do
    user = users(:mozart)
    post api_v1_auth_url, params: { email: user.email, password: 'mozart!123' }

    assert_response :success
    assert @response.body.include? 'token'
  end
end
