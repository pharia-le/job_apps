5.times do 
    User.create(fname: Faker::Name.first_name, lname: Faker::Name.last_name, email: Faker::Internet.email, password: "password" )
end

20.times do
    Application.create(company: Faker::Company.name, position: Faker::Job.position, deadline: Faker::Date.forward(days: 30), description: Faker::Company.buzzword, comments: Faker::Company.bs, user_id: rand(5))
end