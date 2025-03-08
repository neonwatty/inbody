require "test_helper"

class UserProfileTest < ActiveSupport::TestCase
  test "edit user profile" do
    # create new user
    user = User.create(email: "profile_model_test@example.com", password: "password123")
    assert user.valid?

    # edit first and last name, and phone number in user profile
    user_profile = user.user_profile
    user_profile.first_name = "John"
    user_profile.last_name = "Doe"
    user_profile.phone_number = "123-456-7890"
    user_profile.save
    assert user_profile.valid?

    # confirm that first and last name are updated
    assert_equal "John", user_profile.first_name
    assert_equal "Doe", user_profile.last_name

    # try to update phone number with already existing phone number
    user2 = User.create(email: "profile_model_test_2@example.com", password: "password123")
    user_profile2 = user2.user_profile
    user_profile2.phone_number = "123-456-7890"
    user_profile2.save
    assert_not user_profile2.valid?

    # destroy user
    user.destroy
end
end
