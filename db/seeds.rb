include RandomData
require 'faker'

member1 = User.create!(
  email: 'member1@example.com',
  password: 'helloworld'
)

member2 = User.create!(
  email: 'member2@example.com',
  password: 'helloworld'
)

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'helloworld'
  )
end

users = User.all

50.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end
