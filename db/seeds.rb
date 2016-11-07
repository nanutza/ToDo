users = []

10.times {
  users << User.create!(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'password',
    avatar: Faker::Avatar.image(Faker::Lorem.word, "80x80"))
}

lists = []

20.times {
  lists << List.create!(
    name: Faker::Book.title,
    user: users.sample
  )
}

tasks = []

50.times {
  tasks << Task.create!(
    description: Faker::Hacker.say_something_smart,
    list: lists.sample,
    deadline: Time.now - rand(1..50).days
  )
}
