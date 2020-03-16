require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  test "creates authentication" do
    user = users(:mozart)
    post api_v1_auth_url, params: { email: user.email, password: 'mozart!123' }

    assert_response :success
    assert @response.body.include? 'token'
  end

  test "responds unauthorized when invalid email or passwor" do
    post api_v1_auth_url, params: { email: 'invalid@test.com', password: 'invalid123' }

    assert_response :unauthorized
  end
end
