5.times do
  User.create(
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      name: Faker::Name.name
  )
end