class User < ApplicationRecord
  has_secure_password
  # Geocoding for users location, would ultimately like to have in locate using IP
  geocoded_by :current_location
  after_validation :geocode

  # How to make sure I am getting current data types
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :bio, length: { in: 10..500 }, on: :update
  validates :sun, :moon, :ascending, :mercury, :venus, :mars, :birthday, :birth_time, :birth_location, :gender, :interested_in, :seen_by, :pronouns, :current_location, :longitude, :latitude, presence: true, on: :update
end
