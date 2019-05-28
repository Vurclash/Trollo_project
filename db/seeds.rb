u = User.create(email: "test@test.com", password: "password", password_confirmation: "password")

10.times do 
  Project.create(title: Faker::Superhero.name, power: Faker::Superhero.power, user_id: u.id)

  Sidekick.create(name: Faker::Superhero.name, power: Faker::Superhero.power, hero: Faker::Superhero.name, user_id: u.id)
end

puts "Successfully seeded"