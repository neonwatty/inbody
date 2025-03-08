class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end

    # Add an index to email_address to ensure uniqueness
    add_index :user_profiles, :email_address, unique: true
  end
end
