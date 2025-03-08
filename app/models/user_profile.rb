class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_img

  # - make phone number optional
  # - limit first / last names to 100 chars each

  validates :email_address, presence: true, uniqueness: true
end
