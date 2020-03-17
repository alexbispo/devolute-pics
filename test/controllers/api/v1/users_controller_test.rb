require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "creates an user" do
    post api_v1_users_url, params: {username: 'tempestade',
                                    email:    'tempe@test.com',
                                    password: 'mozart!123'}

    assert_response :created
    assert @response.body.include? 'userId'
  end

  test "responds unprocessable entity when user data is invalid." do
    post api_v1_users_url, params: {username: 'invalid',
                                    email:    'invalid',
                                    password: ''}

    assert_response :unprocessable_entity
  end
end
