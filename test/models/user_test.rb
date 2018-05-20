require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user_has_email" do
  assert_equal "example@example.com", users(:one).email
    end
 

test "user should be invalid without password" do
    users(:one).encrypted_password=nil
    assert_nil users(:one).encrypted_password
    assert_equal false, users(:one).valid?

  end
end