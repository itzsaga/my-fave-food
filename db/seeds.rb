5.times do
  User.create(
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      name: Faker::Name.name
  )
end

@user_count = User.all.count

(@user_count*2).times do
  Place.create(
      name: Faker::Company.name,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      zip_code: Faker::Number.number(5),
      user_id: rand(1..@user_count)
  )
end

@place_count = Place.all.count

(@place_count*2).times do
  i = Item.new(
      name: Faker::Food.ingredient,
      rating: rand(1..5),
      notes: Faker::Hipster.sentence
  )
  i.place_ids = ["#{rand(1..@user_count)}"]
  i.save
end