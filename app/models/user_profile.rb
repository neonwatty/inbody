class UserProfile < ApplicationRecord
  belongs_to :user

  # Associations with Active Storage for profile image
  has_one_attached :profile_img

  # Validations
  validates :email_address, presence: true, uniqueness: true
  validates :first_name, length: { maximum: 100 }, allow_blank: true
  validates :last_name, length: { maximum: 100 }, allow_blank: true
  validates :phone_number, allow_blank: true, format: { with: /\A[0-9\-\+\(\)\s]*\z/, message: "only allows valid phone numbers" }

end
