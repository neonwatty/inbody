class AddEmailAddressToUserProfiles < ActiveRecord::Migration[8.0]
  def change
    add_column :user_profiles, :email_address, :string
  end
end
