u = User.create(email: "test@test.com", password: "password", password_confirmation: "password")

10.times do 
  Project.create(title: Faker::Superhero.name, power: Faker::Superhero.power, user_id: u.id)
end

puts "Successfully seeded"