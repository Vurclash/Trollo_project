u = User.create(email: "test@test.com", password: "password", password_confirmation: "password")

10.times do 
  Project.create(title: Faker::Cosmere, user_id: u.id)
end