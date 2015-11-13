include RandomData

member1 = User.create!(
  email: 'member1@example.com',
  password: 'helloworld'
)

member2 = User.create!(
  email: 'member2@example.com',
  password: 'helloworld'
)

member3 = User.create!(
  email: 'member3@example.com',
  password: 'helloworld'
)

users = User.all

50.times do
  Item.create!(
    user: users.sample,
    name: RandomData.random_sentence
  )
end
