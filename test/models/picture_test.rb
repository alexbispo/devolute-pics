require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  test "create a picture" do
    user = users(:mozart)
    image = Rack::Test::UploadedFile.new(File.join(fixture_path, 'files/colcheia.png'))
    pic = Picture.new(user: user, file: image)

    assert pic.save
  end

  test "file attached" do
    user = users(:mozart)
    pic = Picture.new(user: user, file: nil)

    assert_not pic.save
    assert pic.errors[:file].any?
  end
end
