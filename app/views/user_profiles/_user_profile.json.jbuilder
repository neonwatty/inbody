json.extract! user_profile, :id, :user_id, :first_name, :last_name, :phone_number, :profile_img, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
json.profile_img url_for(user_profile.profile_img)
