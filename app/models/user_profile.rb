class UserProfile < ApplicationRecord
  belongs_to :user

  # Associations with Active Storage for profile image
  has_one_attached :profile_img do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  # Validations
  validates :first_name, length: { maximum: 100 }, allow_blank: true
  validates :last_name, length: { maximum: 100 }, allow_blank: true

  # Apply uniqueness and format validations only if phone_number is present
  validates :phone_number, uniqueness: true, if: :phone_number_present?
  validates :phone_number, format: { with: /\A[0-9\-\+\(\)\s]*\z/, message: "only allows valid phone numbers" }, if: :phone_number_present?

  private

  # Check if phone_number is present
  def phone_number_present?
    phone_number.present?
  end
end
