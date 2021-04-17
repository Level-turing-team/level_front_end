class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    user = find_or_initialize_by(google_id: auth.uid.to_s)
    user.email = auth.info.email
    user.google_id = auth.uid.to_s
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.save
    user
  end

  def self.find_circle(circle_data)
    circle_data.map do |profile|
      User.find(profile[:attributes][:user_id])
    end
  end
end