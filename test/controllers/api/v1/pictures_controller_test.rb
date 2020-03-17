require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest

  test "creates a picture" do
    user = users(:mozart)
    token = authenticate(user.email, 'mozart!123')

    post api_v1_pictures_url,
         headers: {'Authorization': token},
         params: {file: fixture_file_upload('files/colcheia.png')}

    assert_response :created
  end

  test "responds unprocessable entity when pictures data is invalid." do
    user = users(:mozart)
    token = authenticate(user.email, 'mozart!123')

    post api_v1_pictures_url,
         headers: {'Authorization': token},
         params: {file: nil}

    assert_response :unprocessable_entity
    assert @response.body.include? 'file'
  end

  test "responds with a list of pictures" do
    user = users(:mozart)
    token = authenticate(user.email, 'mozart!123')

    post api_v1_pictures_url,
         headers: {'Authorization': token},
         params: {file: fixture_file_upload('files/colcheia.png')}

    get api_v1_pictures_url, headers: {'Authorization': token}

    assert_response :ok
    assert JSON.parse(@response.body).first['url'].include? 'colcheia.png'
  end
end
