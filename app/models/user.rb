class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :user_profile, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  after_create :create_profile

  private

  def create_profile
    create_user_profile(email_address: email) # Auto-fill email from user
  end
end
