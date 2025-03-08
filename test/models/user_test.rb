require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end  user = User.create(email: "test@example.com", password: "password123")

  test "create user" do
    # create new user
    user = User.create(email: "test@example.com", password: "password123")
    assert user.valid?

    # assert that user profile is created
    assert_not_nil user.user_profile

    # destroy user
    user.destroy

    # assert that user profile is destroyed
    assert_nil user.user_profile
  end

  test "confirm uniqueness of email" do
    # create new user
    user = User.create(email: "test@example.com", password: "password123")
    assert user.valid?

    # create another user with the same email
    user2 = User.create(email: "test@example.com", password: "password123")
    assert_not user2.valid?

    # destroy user
    user.destroy
  end
end
