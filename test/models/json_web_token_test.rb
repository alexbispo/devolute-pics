require 'test_helper'

class JsonWebTokenTest < ActiveSupport::TestCase

  test "it encodes payload" do
    token = JsonWebToken.encode({ id: 2, username: 'mozart' })

    assert token.is_a? String
    assert token.length > 100
  end

  test "it decodes token" do
    token = JsonWebToken.encode({ id: 2, username: 'mozart' })
    payload = JsonWebToken.decode(token)

    assert payload['id'] == 2
    assert payload['username'] == 'mozart'
  end
end
