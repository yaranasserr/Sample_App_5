# Create a main sample user.
User.create!(name: "yarry",
  email: "yarry@yarry.com",
  password: "1234567",
  password_confirmation: "1234567",
  admin: true,
  activated: true,
  activated_at: Time.zone.now)

  # Generate a bunch of additional users.
  99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
  email: email,
  password: password,
  password_confirmation: password,
  activated: true,
  activated_at: Time.zone.now)
  end
