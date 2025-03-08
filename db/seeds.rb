# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# if in dev or test, load fixtures
if Rails.env.development? || Rails.env.test?
  # load fixtures
  Rake::Task["db:fixtures:load"].invoke

  # load profile images for each user in user_profile.yml fixture
  user_profiles = UserProfile.all
  user_fixture_ids = ['one', 'two'] # only upload profile_imgs for first two users
  user_profiles.each_with_index do |user_profile, index|
    if index < 2
      user_profile.profile_img.attach(
      io: File.open(Rails.root.join("test/fixtures/files/profile_img/profile_img_#{user_fixture_ids[index]}.jpg")),
      filename: "profile_img_#{user_fixture_ids[index]}.jpg"
      )
    end
  end
end
