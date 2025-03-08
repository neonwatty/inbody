class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :user_profile, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true

  after_create :create_profile

  private

  # This method creates a user profile after the user is created
  def create_profile
    create_user_profile(
      user: self,            # Pass the entire user instance
      email_address: email_address   # Set the email_address explicitly
    )
  end
end
