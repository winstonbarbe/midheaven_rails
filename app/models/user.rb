class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :bio, length: { in: 10..500 }, on: :update
  validates :sun, :moon, :ascending, :mercury, :venus, :mars, :birthday, :birth_time, :birth_location, :gender, :interested_in, :seen_by, :pronouns, :current_location, :longitude, :latitude, presence: true, on: :update
  validates :current_location, length: { minimum: 6}, on: :update
end
