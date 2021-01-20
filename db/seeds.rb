# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ["Bob", "JD", "Anne", "Skip", "Gutter", "Dag", "Lu", "Cray", "Phoenix"]
signs = ["aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra", "scorpio", "sagittarius", "capricon", "aquarius", "pisces"]
cities = ["Athens, GA", "Monroe, GA", "Winder, GA", "Winterville, GA", "Bogart, GA", "Hull, GA"]
count = 2

20.times do
  user = User.new( 
    name: names.sample, 
    email: "user#{count}.com", 
    password: "password", 
    password_confirmation: "password", 
    sun: signs.sample, 
    moon: signs.sample, 
    ascending: signs.sample, 
    mercury: signs.sample, 
    venus: signs.sample, 
    mars: signs.sample, 
    gender: 1, 
    interested_in: 1, 
    bio: "a short bio", 
    current_location: cities.sample 
  )
  user.save
  count += 1
end