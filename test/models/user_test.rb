require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should be possible create a user" do
    user = User.create(username: 'mozart', email: 'mozart@test.com', password: 'tempe!123')

    assert user.errors.empty?
  end

  test "email should be present." do
    user = User.create(email: '')

    assert user.errors[:email].any?
  end

  %w[
    invalid
    a@a
    a@a.a
  ].each do |email|
    test "email (#{email}) should be invalid." do
      user = User.create(email: email)

      assert user.errors[:email].any?
    end
  end

  test "username should be present." do
    user = User.create(username: '')

    assert user.errors[:username].any?
  end

  test "password should be present." do
    user = User.create(password: '')

    assert user.errors[:password].any?
  end

  test "username should be unique" do
    user1 = User.create(username: 'mozart', email: 'mozart@test.com', password: 'tempe!123')
    user2 = User.create(username: 'mozart', email: 'mozart@test.com', password: 'tempe!123')

    assert user2.errors[:username].any?
  end

  test "email should be unique" do
    user1 = User.create(username: 'mozart', email: 'mozart@test.com', password: 'tempe!123')
    user2 = User.create(username: 'mozart1988', email: 'mozart@test.com', password: 'tempe!123')

    assert user2.errors[:email].any?
  end

  test "password has at last 8 characters" do
    user = User.create(password: 'tempe')

    assert user.errors[:password].any?
  end

  test "password has at maximum 20 characters" do
    user = User.create(password: 't' * 21)

    assert user.errors[:password].any?
  end

  test "username has at least 3 characters" do
    user = User.create(username: 'mo')

    assert user.errors[:username].any?
  end

  test "username has at maximum 20 characters" do
    user = User.create(username: 'm' * 21 )

    assert user.errors[:username].any?
  end
end
