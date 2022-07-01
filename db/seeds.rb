n = 10

User.find_or_create_by(email: "example@railstutorial.org") do |user|
  user.name = "Example User"
  user.password = "password"
end

n.times do
  email = Faker::Internet.unique.email
  User.find_or_create_by(email: email) do |user|
    user.name = Faker::Name.name
    user.password = "password"
  end
end
