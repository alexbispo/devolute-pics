require 'test_helper'

class PictureCreationServiceTest < ActiveSupport::TestCase

  test "#add returns the added picture." do
    picture_params = {file: fixture_file_upload('files/colcheia.png')}
    picture_creation_service = PictureCreationService.new

    picture = picture_creation_service.add(users(:mozart), picture_params)

    assert picture.persisted?
  end

  test "#add returns picture with errors" do
    picture_params = {file: nil}
    picture_creation_service = PictureCreationService.new

    picture = picture_creation_service.add(users(:mozart), picture_params)

    assert_not picture.persisted?
    assert picture.errors.present?
  end
end
