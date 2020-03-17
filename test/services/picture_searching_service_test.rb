require 'test_helper'

class PictureSearchingServiceTest < ActiveSupport::TestCase

  test "#all_by_user returns the an list of pictures by user." do
    pic = pictures(:img01)
    pic.file = fixture_file_upload('files/colcheia.png')
    pic.save!

    pics = PictureSearchingService.new.all_by_user(users(:jhon))

    assert pics.count == 1
  end

  test "#all_by_user returns empty list." do
    user = User.create(username: 'tempe', email: 'tempe@test.com', password: 'mozart!123')

    pics = PictureSearchingService.new.all_by_user(user)

    assert pics.empty?
  end
end
