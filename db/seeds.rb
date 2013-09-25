10.times do
  new_user = User.new(name: Faker::Name.name, email: Faker::Internet.email)
  new_user.password = "test"
  new_user.password_confirmation = "test"
  new_user.save

end


10.times do
  Post.create(title: Faker::Lorem.words(5).join(" ").capitalize, url: Faker::Internet.url, user_id: 2)

end

100.times do
  Comment.create(body: Faker::Company.bs + Faker::Company.bs + Faker::Company.bs + Faker::Company.bs,
                user_id: rand(1..10), post_id: rand(1..10))
end
