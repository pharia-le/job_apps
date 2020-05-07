5.times do 
    User.create(fname: Faker::Name.first_name, lname: Faker::Name.last_name, email: Faker::Internet.email, password: "password" )
end

40.times do
    Application.create(company: Faker::Company.name, position: Faker::Job.position, status: ["Ready to Apply", "Applied", "Signed", "Interview Scheduled", "Archived"].sample , deadline: Faker::Date.forward(days: 30), description: Faker::Company.industry, comments: Faker::Company.bs, user_id: rand(5))
end