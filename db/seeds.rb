3.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  3.times do
    user.beers.create(name: Faker::Beer.name, style: Faker::Beer.style, rating: Faker::Number.between(from: 0.0, to: 10.0))
  end
end
