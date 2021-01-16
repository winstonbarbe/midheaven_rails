class User < ApplicationRecord
  has_secure_password
  # Geocoding for users location, would ultimately like to have in locate using IP
  geocoded_by :current_location
  after_validation :geocode
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :bio, length: { in: 10..500 }, on: :update
  validates :sun, :moon, :ascending, :mercury, :venus, :mars, :birthday, :birth_time, :birth_location, :gender, :interested_in, :seen_by, :pronouns, :current_location, :longitude, :latitude, presence: true, on: :update

  # Custom Validations

  validate :min_age, :valid_sign, on: :update

  # Custom Validation Methods
  def min_age
    age_requirement = Date.today - 6570

    return if birthday < age_requirement

    if birthday > age_requirement
      errors.add(:birthday, "You must be at least 18 years old to sign up.")
    end
  end
  def valid_sign
    signs = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "picses"]
    return if signs.include?(:sun.downcase) && signs.include?(:moon.downcase) && signs.include?(:ascending.downcase) && signs.include?(:mercury.downcase) && signs.include?(:venus.downcase) && signs.include?(:mars.downcase)

    if !signs.include?(sun.downcase)
      errors.add(:sun, "sign must be valid. Check your spelling.")
    end
    if !signs.include?(moon.downcase)
      errors.add(:moon, "sign must be valid. Check your spelling.")
    end
    if !signs.include?(ascending.downcase)
      errors.add(:ascending, "sign must be valid. Check your spelling.")
    end
    if !signs.include?(mercury.downcase)
      errors.add(:mercury, "sign must be valid. Check your spelling.")
    end
    if !signs.include?(venus.downcase)
      errors.add(:venus, "sign must be valid. Check your spelling.")
    end
    if !signs.include?(mars.downcase)
      errors.add(:mars, "sign must be valid. Check your spelling.")
    end
  end

end
